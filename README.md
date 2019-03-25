# IoTDataModels

This repo contains the data models that are part of the OCF core specification.

latest that is availabe can be found at:

https://openconnectivity.org/specs/OCF_Core_Specification.pdf


## referencing files via http(s) from github

github repos that has the GitHub Pages feature turned on has the following syntax:

http(s)://[organisation name].github.io/[repo name]/path+filename

open connectivity foundation repos with github pages feature turned on:
- bridging
- certification
- core
- core-extensions
- devicemodels
- IoTDataModels
- OCF-oneM2M
- security


## referencing files with full URL
This repo uses the github pages feature.
e.g. all files can be accessed by using the URL:

http://openconnectivityfoundation.github.io/core/

and then use the path and filename to retrieve the file by means of http(s).

The URL of the swagger file with rt type = oic.wk.mnt is:

http://openconnectivityfoundation.github.io/core/swagger2.0/oic.wk.mnt.swagger.json


The full url can be used to reference a property definition. 
For example to reference in a schema the definition of UUID defined in the schema file: oic.types-schema.json use:

"$ref": "http://openconnectivityfoundation.github.io/core/schemas/oic.types-schema.json#definitions/uuid"
