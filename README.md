# core

This repo contains the data models that are part of the OCF core specification. The latest version of which can be found at:

https://openconnectivity.org/specs/OCF_Core_Specification.pdf

## referencing files with full URL

This repo uses the GitHub pages feature. e.g. all files can be accessed by using the URL:

http://openconnectivityfoundation.github.io/core/

and then use the path and filename to retrieve the file by means of http(s). For example, the URL of the swagger file with rt type = oic.wk.p is:

http://openconnectivityfoundation.github.io/core/swagger2.0/oic.wk.p.swagger.json

The full url can be used to reference a property definition. For example to reference in a schema the definition of UUID defined in the schema file: oic.types-schema.json use:

"$ref": "http://openconnectivityfoundation.github.io/core/schemas/oic.types-schema.json#definitions/uuid"

## Introspection
### Examples

[The examples folder](https://github.com/openconnectivityfoundation/core/tree/master/examples) contains two examples showing how Introspection Device Data (IDD) may be constructed for a Device.

[introspectiondevicedataexample.swagger.json](https://github.com/openconnectivityfoundation/core/tree/master/examples/introspectiondevicedataexample.swagger.json) illustrates a simple device that exposes an instance of a Binary Switch Resource and an instance of a Brightness Resource

[introspectiondevicedataexample-collections.swagger.json](https://github.com/openconnectivityfoundation/core/tree/master/examples/introspectiondevicedataexample-collections.swagger.json) illustrates a case where the Device supports the ability to create instances of Binary Switch and instances of Humidity via a Collection that exposes the *oic.if.create* OCF Interface.

### Applying the IDD to a created Resource

In the Collections case a Client can determine how to apply the IDD definition for created Resources via the following procedure:

-	Client creates a Resource using POST with *oic.if.create*
-	The newly created Resource is added as a Link in the Collection
-	The URL for the newly created Resource is provided to the Client in the success path response
-	The Client can then retrieve the Resource using the provided URL using the *oic.if.baseline* OCF Interface
-	The Resource Representation returned provides the Client with the Resource Type of the created Resource (referenced below as **{created RT}**)
-	The Client knows how to deal with the created Resource from the "/Collection Root/**{created RT}**" URL in the IDD
