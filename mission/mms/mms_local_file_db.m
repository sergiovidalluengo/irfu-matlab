classdef mms_local_file_db < mms_file_db
  %MMS_LOCAL_FILE_DB  Local file database for MMS
  %   Class handling a database of local MMS files
  
  properties (SetAccess = immutable)
    dbRoot 
  end
  
  methods
    function obj = mms_local_file_db(rootPath)
      if nargin == 0, rootPath = pwd; end
      if (rootPath(end)==filesep), rootPath(end)=[]; end % path only, excluding last filesep
      
      obj@mms_file_db(rootPath); obj.dbRoot = rootPath;
      if nargin == 0, return, end
      if ~ischar(rootPath) || exist(rootPath,'dir')~=7
        errStr = 'rootPath must be a directory path name';
        irf.log('critical',errStr), error(errStr)
      end
    end
    %% LIST FILES
    function fileList = list_files(obj,filePrefix,tint)
      narginchk(2,3)
      fileList = [];
      if nargin==3 && ~isa(tint,'GenericTimeArray'),
        error('Expecting TINT (GenericTimeArray)')
      elseif nargin==2, tint = [];
      end
      if length(filePrefix) < 3 || ~strcmp(filePrefix(1:3),'mms')
        errStr = 'filePrefix must begin with mms*';
        irf.log('critical',errStr), error(errStr)
      end
      C = strsplit(filePrefix,'_');
      if length(C)<3
        errStr = 'filePrefix too short';
        irf.log('critical',errStr), error(errStr)
      end
      if strcmp(C{2},'ancillary'),
        list_ancillary();
        if isempty(fileList) || isempty(tint), return, end
        pick_ancillary();
      else
        if ~isempty(tint), list_sci_tint()
        else
          irf.log('warning','THIS MAY TAKE SOME TIME')
          list_sci()
        end
      end
      % END LIST_FILES
      %% PICK ANCILLARY
      function pick_ancillary()
        fileList = fileList(arrayfun(@(x) x.start<=tint.stop,fileList) &...
          arrayfun(@(x) x.stop>=tint.start,fileList));
      end
      %% LIST ANCILLARY
      function list_ancillary()
        fileDir = [obj.dbRoot filesep C{2} filesep C{1} filesep C{3}];
        if exist(fileDir,'dir')~=7, return, end
        filePref = [upper(C{1}) '_' upper(C{3})];
        listing = dir([fileDir filesep filePref '*.V*']);
        if isempty(listing), return, end
        arrayfun(@(x) add2list(x.name), listing)
 
        function add2list(name)
          [~,fName,fExt] = fileparts(name);
          ver = str2double(fExt(3:4));
          entry = struct('name',name,'ver',fExt(3:4),'dir',fileDir,...
            'start',[],'stop',[]);
          if isempty(fileList), fileList = add_ss(entry); return, end
          hasFile = arrayfun(@(x) ~isempty(strfind(x.name,fName)),fileList);
          if ~any(hasFile), fileList = [fileList add_ss(entry)]; return, end
          iSame = find(hasFile);
          if length(iSame) > 1, error('multiple files with same name'),end
          if ver>str2double(fileList(iSame).ver)
            fileList(iSame) = add_ss(entry);
          end
          function e = add_ss(e)
            e.start = get_time('start');
            e.stop = get_time('stop');
            function epoch = get_time(s)
              epoch = [];
              cmd = sprintf('grep -m1 -i %s_time %s/%s | awk ''{print $3}''',...
                s,e.dir,e.name);
              [sta,out] = unix(cmd); if sta>0, return, end
              if isempty(out)
                cmd = sprintf('grep -m1 -i %stime %s/%s | awk ''{print $3}''',...
                  s,e.dir,e.name);
                [sta,out] = unix(cmd); if sta>0 || isempty(out), return, end
              end
              sss = [irf_time([str2double(out(1:4)), str2double(out(6:8))],...
                'doy>utc_yyyy-mm-dd') 'T'];
              if length(out) == 19, sss = [sss out(10:17) '.000000000Z']; % ie. predatt (time string end with "hh:mm:ss\n") add remaining .mmmuuunnnZ
              else sss = [sss out(10:21) '000000Z']; % defatt, depeph etc (time string end with "hh:mm:ss.mmm\n" add remaining uuunnnZ
              end
              epoch = EpochTT2000(sss);
            end
          end % ADD_SS
        end % ADD2LIST
      end % LOAD_ANCILLARY
      
      %% LIST_SCI_TINT
      function list_sci_tint()
        fDir = get_prefix();
        TStart = get_times(tint.start); TStop = get_times(tint.stop);
        for year = TStart.year:TStop.year
          moStart = 1; moStop = 12;
          if year==TStart.year, moStart = TStart.month; end
          if year==TStop.year, moStop = TStop.month; end
          for mo = moStart:moStop
            curDir = sprintf('%s%s%d%s%02d',fDir,filesep,year,filesep,mo);
            if (year==TStart.year && mo==TStart.month) || ...
                (year==TStop.year && mo==TStop.month)
              dStart = 1; dStop = 31;
              if year==TStart.year && mo==TStart.month
                dStart = TStart.day;
              end
              if year==TStop.year && mo==TStop.month, dStop = TStop.day;end
              for day = dStart:dStop
                dPref = sprintf('%s_%d%02d%02d',filePrefix,year,mo,day);
                listingD = dir([curDir filesep dPref '*.cdf']);
                if isempty(listingD), continue, end
                arrayfun(@(x) add2list_sci(x.name,curDir), listingD)
              end
            else % List all files
              dPref = sprintf('%s_%d%02d',filePrefix,year,mo);
              listingD = dir([curDir filesep dPref '*.cdf']);
              if isempty(listingD), continue, end
              arrayfun(@(x) add2list_sci(x.name,curDir), listingD)
            end
          end
        end
        
        function p = get_prefix()
          p = obj.dbRoot;
          for ix=1:length(C), p = [p filesep C{ix}]; end %#ok<AGROW>
        end
        function t = get_times(tt)
          utc = tt.toUtc();
          t.year  = str2double(utc(1:4));
          t.month = str2double(utc(6:7));
          t.day   = str2double(utc(9:10));
          t.hour  = str2double(utc(12:13));
          t.min   = str2double(utc(15:16));
          t.sec   = str2double(utc(18:end-1));
        end
      end
      
      %% LIST SCI
      function list_sci()
        fileDir = obj.dbRoot;
        for i=1:length(C), fileDir = [fileDir filesep C{i}]; end %#ok<AGROW>
        if exist(fileDir,'dir')~=7, return, end
        listingY = dir(fileDir);
        for iDir = 1:length(listingY)
          % Loop over years
          if ~listingY(iDir).isdir, continue, end
          dNameY = listingY(iDir).name;
          if length(dNameY)~=4, continue, end
          yyyy = str2double(dNameY);
          if yyyy<2015 || yyyy > 2050, continue, end
          listingM = dir([fileDir filesep dNameY]);
          for iDirMo = 1:length(listingM)
            if ~listingM(iDirMo).isdir, continue, end
            dNameM = listingM(iDirMo).name;
            if length(dNameM)~=2, continue, end
            switch dNameM(1)
              case '0', if ~any(dNameM(2)=='123456789'), continue, end
              case '1', if ~any(dNameM(2)=='012'), continue, end
              otherwise, continue
            end
            curDir = [fileDir filesep dNameY filesep dNameM];
            listingD = dir([curDir filesep filePrefix '*.cdf']);
            if isempty(listingD), continue, end
            arrayfun(@(x) add2list_sci(x.name,curDir), listingD)
          end
        end
      end % LOAD_SCI
      %% ADD2LIST_SCI
      function add2list_sci(name,curDir)
        fnd = mms_fields_file_info(name);
        Entry = struct('name',name,'ver',fnd.vXYZ,'dir',curDir,...
          'start',[],'stop',[]);
        Entry = add_ss(Entry);
        % Check time limits of the file
        if ~isempty(tint)&&(Entry.start>tint.stop || Entry.stop<tint.start)
            return
        end
        if isempty(fileList), fileList = Entry; return, end
        fName = [fnd.scId '_' fnd.instrumentId '_' fnd.tmMode '_' ...
          fnd.dataLevel];
        if ~isempty(fnd.dataType), fName = [fName '_' fnd.dataType]; end
        fName = [fName '_' fnd.date '_'];
        
        hasFile = arrayfun(@(x) ~isempty(strfind(x.name,fName)),fileList);
        if ~any(hasFile), fileList = [fileList add_ss(Entry)]; return, end
        iSame = find(hasFile);
        if length(iSame) > 1,
          error('multiple files with same name'),
        end
        
        Ver = get_ver(fileList(iSame)); fVer = get_ver(fnd.vXYZ);
        if(fVer.maj>Ver.maj) || ... % Newer major version
            (fVer.maj==Ver.maj && fVer.min>Ver.min) || ... % Same major version, newer calibration
            (fVer.maj==Ver.maj && fVer.min==Ver.min && fVer.rev>Ver.rev) % Same major and calib. but newer revision, replace file
          fileList(iSame) = add_ss(Entry); % replace file
        %else, older file.
        end
        function ver = get_ver(verS)
           vT = strsplit(verS,'.');
           for iTmp=1:length(vT), vT{iTmp} = str2double(vT{iTmp}); end
           ver = struct('maj',vT{1},'min',0,'rev',0);
           if isempty(vT{2}), return, end, ver.min = vT{2};
           if isempty(vT{3}), return, end, ver.rev = vT{3};
        end
        function entry = add_ss(entry)
          data = cdfread([entry.dir filesep entry.name],'Variables',...
            'Epoch','CombineRecords',true,'KeepEpochAsIs',true);
          if isempty(data), return, end
          entry.start = EpochTT2000(data(1));
          entry.stop = EpochTT2000(data(end));
        end % ADD_SS
      end % ADD2LIST
    end % LIST_FILES
    %% LOAD FILES
    function res = load_file(obj,fileName)
      narginchk(2,3)
      C = strsplit(lower(fileName),'_');
      if strcmpi(fileName(end-3:end),'.cdf'),
        d =  C{end-1}; p = obj.dbRoot;
        for ix=1:(length(C)-2), p = [p filesep C{ix}]; end %#ok<AGROW>
        p = [p filesep d(1:4) filesep d(5:6)];
        res = dataobj([p filesep fileName]);
      else % ancillary
        p = [obj.dbRoot filesep 'ancillary' filesep C{1} filesep C{2}];
        [res,~] = mms_load_ancillary([p filesep fileName],C{2});     
      end
    end % LOAD_FILES
  end
  
end

