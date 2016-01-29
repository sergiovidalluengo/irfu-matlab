function res = mms_sci_roi()
%MMS_SCI_ROI list of science ROI
%
% roiList = MMS_SCI_ROI()
%
% New ROIs are obrained by running the following command within IDL/EVA:
% print, time_string(mms_get_roi(['2015-09-01/00:00','2016-01-19/24:00']))

res = [...
'2016-01-27T19:48:04Z/2016-01-28T07:13:34Z';...
'2016-01-26T19:55:14Z/2016-01-27T07:20:44Z';...
'2016-01-25T20:02:14Z/2016-01-26T07:28:04Z';...
'2016-01-24T19:21:24Z/2016-01-25T07:40:14Z';...
'2016-01-23T19:28:14Z/2016-01-24T07:47:24Z';...
'2016-01-22T19:35:14Z/2016-01-23T07:54:34Z';...
'2016-01-21T19:42:04Z/2016-01-22T08:01:44Z';...
'2016-01-20T19:48:54Z/2016-01-21T08:08:44Z';...
'2016-01-19T19:55:44Z/2016-01-20T08:15:44Z';...
'2016-01-18T20:02:54Z/2016-01-19T08:22:34Z';...
'2016-01-17T20:09:44Z/2016-01-18T08:29:34Z';...
'2016-01-16T20:16:44Z/2016-01-17T08:36:24Z';...
'2016-01-15T20:23:44Z/2016-01-16T08:43:24Z';...
'2016-01-14T20:30:54Z/2016-01-15T08:50:24Z';...
'2016-01-13T20:37:54Z/2016-01-14T08:57:24Z';...
'2016-01-12T20:45:04Z/2016-01-13T09:04:34Z';...
'2016-01-11T20:51:54Z/2016-01-12T09:11:54Z';...
'2016-01-10T20:17:54Z/2016-01-11T09:27:04Z';...
'2016-01-09T20:24:34Z/2016-01-10T09:34:14Z';...
'2016-01-08T20:31:14Z/2016-01-09T09:41:04Z';...
'2016-01-07T20:37:54Z/2016-01-08T09:48:04Z';...
'2016-01-06T20:44:34Z/2016-01-07T09:54:54Z';...
'2016-01-05T20:51:24Z/2016-01-06T10:01:44Z';...
'2016-01-04T20:58:14Z/2016-01-05T10:08:14Z';...
'2016-01-03T21:05:04Z/2016-01-04T10:15:04Z';...
'2016-01-02T21:12:04Z/2016-01-03T10:21:54Z';...
'2016-01-01T21:18:54Z/2016-01-02T10:28:44Z';...
'2015-12-31T21:25:54Z/2016-01-01T10:35:44Z';...
'2015-12-30T21:32:54Z/2015-12-31T10:42:34Z';...
'2015-12-29T21:39:44Z/2015-12-30T10:49:44Z';...
'2015-12-28T21:46:34Z/2015-12-29T10:56:44Z';...
'2015-12-27T21:18:24Z/2015-12-28T11:03:44Z';...
'2015-12-26T21:25:04Z/2015-12-27T11:10:34Z';...
'2015-12-25T21:31:44Z/2015-12-26T11:17:24Z';...
'2015-12-24T21:38:24Z/2015-12-25T11:24:14Z';...
'2015-12-23T21:44:54Z/2015-12-24T11:30:54Z';...
'2015-12-22T21:51:34Z/2015-12-23T11:37:44Z';...
'2015-12-21T21:58:14Z/2015-12-22T11:44:14Z';...
'2015-12-20T22:05:04Z/2015-12-21T11:50:54Z';...
'2015-12-19T22:11:44Z/2015-12-20T11:57:34Z';...
'2015-12-18T22:18:44Z/2015-12-19T12:04:14Z';...
'2015-12-17T22:25:34Z/2015-12-18T12:11:04Z';...
'2015-12-16T22:32:24Z/2015-12-17T12:17:44Z';...
'2015-12-15T22:39:14Z/2015-12-16T12:24:34Z';...
'2015-12-14T22:45:54Z/2015-12-15T12:31:24Z';...
'2015-12-13T22:29:24Z/2015-12-14T12:24:14Z';...
'2015-12-12T22:36:04Z/2015-12-13T12:31:04Z';...
'2015-12-11T22:42:24Z/2015-12-12T12:37:44Z';...
'2015-12-10T22:48:54Z/2015-12-11T12:44:14Z';...
'2015-12-09T22:55:24Z/2015-12-10T12:50:44Z';...
'2015-12-08T23:01:54Z/2015-12-09T12:57:14Z';...
'2015-12-07T23:08:25Z/2015-12-08T13:03:45Z';...
'2015-12-06T23:15:14Z/2015-12-07T13:10:14Z';...
'2015-12-05T23:21:54Z/2015-12-06T13:16:44Z';...
'2015-12-04T23:28:44Z/2015-12-05T13:23:24Z';...
'2015-12-03T23:35:34Z/2015-12-04T13:30:04Z';...
'2015-12-02T23:42:14Z/2015-12-03T13:36:44Z';...
'2015-12-01T23:48:54Z/2015-12-02T13:43:34Z';...
'2015-11-30T23:55:34Z/2015-12-01T13:50:14Z';...
'2015-11-29T23:55:04Z/2015-11-30T13:40:04Z';...
'2015-11-29T00:01:34Z/2015-11-29T13:46:44Z';...
'2015-11-28T00:08:04Z/2015-11-28T13:53:24Z';...
'2015-11-27T00:14:34Z/2015-11-27T13:59:54Z';...
'2015-11-26T00:20:54Z/2015-11-26T14:06:24Z';...
'2015-11-25T00:27:24Z/2015-11-25T14:12:44Z';...
'2015-11-24T00:34:04Z/2015-11-24T14:19:14Z';...
'2015-11-23T00:40:34Z/2015-11-23T14:25:34Z';...
'2015-11-22T00:47:14Z/2015-11-22T14:32:04Z';...
'2015-11-21T00:54:04Z/2015-11-21T14:38:34Z';...
'2015-11-20T01:00:44Z/2015-11-20T14:45:14Z';...
'2015-11-19T01:07:34Z/2015-11-19T14:51:54Z';...
'2015-11-18T01:14:04Z/2015-11-18T14:58:34Z';...
'2015-11-17T01:20:44Z/2015-11-17T15:05:14Z';...
'2015-11-16T01:25:04Z/2015-11-16T14:41:04Z';...
'2015-11-15T01:31:34Z/2015-11-15T14:47:34Z';...
'2015-11-14T01:37:54Z/2015-11-14T14:54:04Z';...
'2015-11-13T01:44:14Z/2015-11-13T15:00:34Z';...
'2015-11-12T01:50:44Z/2015-11-12T15:06:44Z';...
'2015-11-11T01:57:14Z/2015-11-11T15:13:04Z';...
'2015-11-10T02:03:44Z/2015-11-10T15:19:24Z';...
'2015-11-09T02:10:24Z/2015-11-09T15:25:54Z';...
'2015-11-08T02:17:04Z/2015-11-08T15:32:24Z';...
'2015-11-07T02:23:54Z/2015-11-07T15:38:54Z';...
'2015-11-06T02:30:34Z/2015-11-06T15:45:24Z';...
'2015-11-05T02:37:14Z/2015-11-05T15:52:04Z';...
'2015-11-04T02:43:54Z/2015-11-04T15:58:54Z';...
'2015-11-03T02:50:24Z/2015-11-03T16:05:34Z';...
'2015-11-02T03:04:55Z/2015-11-02T15:31:05Z';...
'2015-11-01T03:11:34Z/2015-11-01T15:37:44Z';...
'2015-10-31T03:17:54Z/2015-10-31T15:44:14Z';...
'2015-10-30T03:24:24Z/2015-10-30T15:50:44Z';...
'2015-10-29T03:30:54Z/2015-10-29T15:57:04Z';...
'2015-10-28T03:37:24Z/2015-10-28T16:03:34Z';...
'2015-10-27T03:43:54Z/2015-10-27T16:09:54Z';...
'2015-10-26T03:50:34Z/2015-10-26T16:16:14Z';...
'2015-10-25T03:57:14Z/2015-10-25T16:22:44Z';...
'2015-10-24T04:04:04Z/2015-10-24T16:29:14Z';...
'2015-10-23T04:10:54Z/2015-10-23T16:35:54Z';...
'2015-10-22T04:17:34Z/2015-10-22T16:42:34Z';...
'2015-10-21T04:24:14Z/2015-10-21T16:49:24Z';...
'2015-10-20T04:30:44Z/2015-10-20T16:56:04Z';...
'2015-10-19T04:43:14Z/2015-10-19T16:14:44Z';...
'2015-10-18T04:49:44Z/2015-10-18T16:21:14Z';...
'2015-10-17T04:56:04Z/2015-10-17T16:27:44Z';...
'2015-10-16T05:02:34Z/2015-10-16T16:34:04Z';...
'2015-10-15T05:08:54Z/2015-10-15T16:40:24Z';...
'2015-10-14T05:15:14Z/2015-10-14T16:46:34Z';...
'2015-10-13T05:21:54Z/2015-10-13T16:53:14Z';...
'2015-10-12T05:28:44Z/2015-10-12T16:59:44Z';...
'2015-10-11T05:35:34Z/2015-10-11T17:06:14Z';...
'2015-10-10T05:42:24Z/2015-10-10T17:12:34Z';...
'2015-10-09T05:49:04Z/2015-10-09T17:19:34Z';...
'2015-10-08T05:55:54Z/2015-10-08T17:26:14Z';...
'2015-10-07T06:02:34Z/2015-10-07T17:32:54Z';...
'2015-10-06T06:09:14Z/2015-10-06T17:39:44Z';...
'2015-10-05T06:15:54Z/2015-10-05T17:46:34Z';...
'2015-10-04T04:54:24Z/2015-10-04T18:54:04Z';...
'2015-10-03T05:01:04Z/2015-10-03T19:00:44Z';...
'2015-10-02T05:07:34Z/2015-10-02T19:07:24Z';...
'2015-10-01T05:13:24Z/2015-10-01T19:13:54Z';...
'2015-09-30T05:20:04Z/2015-09-30T19:19:44Z';...
'2015-09-29T05:26:44Z/2015-09-29T19:26:24Z';...
'2015-09-28T05:33:24Z/2015-09-28T19:32:44Z';...
'2015-09-27T05:40:24Z/2015-09-27T19:39:24Z';...
'2015-09-26T05:47:14Z/2015-09-26T19:46:14Z';...
'2015-09-25T05:54:04Z/2015-09-25T19:52:54Z';...
'2015-09-24T06:00:54Z/2015-09-24T19:59:44Z';...
'2015-09-23T06:07:34Z/2015-09-23T20:06:44Z';...
'2015-09-22T06:14:14Z/2015-09-22T20:13:24Z';...
'2015-09-22T06:14:14Z/2015-09-22T20:13:24Z';...
'2015-09-21T06:20:44Z/2015-09-21T20:20:14Z';...
'2015-09-20T06:27:14Z/2015-09-20T20:26:54Z';...
'2015-09-19T06:23:54Z/2015-09-19T20:23:24Z';...
'2015-09-18T06:30:24Z/2015-09-18T20:29:54Z';...
'2015-09-17T06:36:34Z/2015-09-17T20:36:24Z';...
'2015-09-16T06:43:54Z/2015-09-16T20:43:44Z';...
'2015-09-15T06:50:44Z/2015-09-15T20:51:24Z';...
'2015-09-14T06:57:34Z/2015-09-14T20:58:04Z';...
'2015-09-13T07:04:34Z/2015-09-13T21:04:44Z';...
'2015-09-12T07:11:24Z/2015-09-12T21:11:34Z';...
'2015-09-11T07:18:14Z/2015-09-11T21:18:24Z';...
'2015-09-10T07:25:04Z/2015-09-10T21:25:14Z';...
'2015-09-09T07:31:54Z/2015-09-09T21:32:14Z';...
'2015-09-08T07:38:44Z/2015-09-08T21:39:04Z';...
'2015-09-07T07:45:24Z/2015-09-07T21:45:54Z';...
'2015-09-06T09:22:04Z/2015-09-06T21:52:34Z';...
'2015-09-05T09:28:44Z/2015-09-05T23:29:24Z';...
'2015-09-04T09:35:24Z/2015-09-04T23:36:04Z';...
'2015-09-03T09:42:04Z/2015-09-03T23:42:44Z';...
'2015-09-02T09:48:44Z/2015-09-02T23:49:14Z';...
'2015-09-01T09:55:24Z/2015-09-01T23:55:54Z';...
'2015-08-31T10:02:14Z/2015-09-01T00:02:24Z'];