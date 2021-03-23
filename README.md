# AmazonSellingPartnerAPIGenerator

This script helps the creation of [**Selling Partner API Developer Guide**](https://github.com/amzn/selling-partner-api-docs/blob/main/guides/developer-guide/SellingPartnerApiDeveloperGuide.md) in their beta phase. This project follow the intructions of [Generating a Java client library](https://github.com/amzn/selling-partner-api-docs/blob/main/guides/developer-guide/SellingPartnerApiDeveloperGuide.md#generating-a-java-client-library) for the creation of a functional libray for *Sellers interface json* ( look before how changes for to other interfaces )

# Requeriments
Only need Git, Docker and Docker compose.

# Get Started
First clone this project 

```
git clone https://github.com/RaulGF92/AmazonSellingPartnerAPI4JGenerator.git
```

Them you must enter inside folder and clone the last version of [**Selling Partner API Models**](https://github.com/amzn/selling-partner-api-models)

```
git clone https://github.com/amzn/selling-partner-api-models.git
```

For last you must start container
```
docker-compose up
```

Finally when container has finished, the main folder (*AmazonSellingPartnerAPI4JGenerator*) would contain a dist folder with a jar and the project compile with target load of compilations.

# Result
> sellingpartnerapi-aa-java-1.0-jar-with-dependencies.jar

this library is a helpfull library to Amazon partner client (selling-partner-client)

> selling-partner-client
It's project target final, it was create by a Swagger Amazon template and load it with esential dependencies for correct work (sellingpartnerapi-aa-java-1.0-jar-with-dependencies.jar).

# Use other model
if you need change the model ( now is using Sellers.json ) you only need change entrypoint.sh file to choose the model you like

```
echo "       Building Swagger Code Project                  "
java -jar "${basePath}/swagger-codegen-cli.jar" generate -i "${basePath}/selling-partner-api-models/models/sellers-api-model/PUT_MODEL_INSIDE_FOLDER_YOU_LIKE.json" -l java -t "${basePath}/selling-partner-api-models/clients/sellingpartner-api-aa-java/resources/swagger-codegen/templates" -o "${basePath}/dist/selling-partner-client"
echo " ########## END GENERATE SWAGGER PROJECT ##############"
```

you can found all sellers in this site:

> https://github.com/amzn/selling-partner-api-models/tree/main/models