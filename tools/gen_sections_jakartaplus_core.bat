
rem ====================================================
rem batch file that creates the resource sections - Core
rem ====================================================

set Template="<path to local instance of the repo>\swagger2doc\input\ResourceTemplate.docx"

rem choice of application: python or executable
set cmd=python.exe  <path to local instance of the repo>\swagger2doc\src\swagger2doc.py

rem make sure that correct template is used
copy %Template%  .\ResourceTemplate.docx

rem Resources 
%cmd% -swagger oic.wk.atomicmeasurement.swagger.json -docx ResourceTemplate.docx -word_out am.swagger.docx -resource AtomicMeasurementResURI?if=oic.if.baseline -annex True
%cmd% -swagger oic.wk.col.swagger.json -docx am.swagger.docx -word_out col.swagger.docx -resource CollectionResURI?if=oic.if.baseline -annex True
%cmd% -swagger oic.wk.d.swagger.json -docx col.swagger.docx -word_out d.swagger.docx -resource oic/d -annex True -wellknown True
%cmd% -swagger oic.wk.res.swagger.json -docx d.swagger.docx -word_out res.swagger.docx -resource oic/res?if=oic.if.baseline -annex True -wellknown True
%cmd% -swagger oic.wk.introspection.swagger.json -docx res.swagger.docx -word_out introspection.swagger.docx -resource IntrospectionResURI -annex True -wellknown True
%cmd% -swagger oic.wk.p.swagger.json -docx introspection.swagger.docx -word_out p.swagger.docx -resource oic/p -annex True -wellknown True
%cmd% -swagger oic.r.mqtt.conf.swagger.json -docx p.swagger.docx -word_out mqttconf.swagger.docx -resource mqttconfResURI -annex True

copy  mqttconf.swagger.docx core.generated.docx
del -f *.swagger.docx

:end
