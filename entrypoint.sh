basePath=$1
echo " ##################################################"
echo "|                                                  |"
echo "|      Amazon Selling Partner API GENERATOR        |"
echo "|                                                  |"
echo "|                                                  |"
echo "|                   @raulgf92                      |"
echo " ##################################################"
echo "   base path: ${basePath}                            "
echo "                   Maven version:                   "
mvn -v
echo " #################### END MAVEN ######################"
echo "                   Java version:                    "
java -version
echo " #################### END JAVA ######################"
echo "                   Clonning new version             "
git clone https://github.com/amzn/selling-partner-api-models.git
echo " #################### END CLONNING ####################"
echo "             Building Amazon Help libray:              "
cd "${basePath}/selling-partner-api-models/clients/sellingpartner-api-aa-java"
mvn clean package
cp "${basePath}/selling-partner-api-models/clients/sellingpartner-api-aa-java/target/sellingpartnerapi-aa-java-1.0-jar-with-dependencies.jar" "${basePath}/dist"
echo "       A copy of libray was copy to dist folder        "
cd "${basePath}"
mvn install:install-file -Dfile="${basePath}/selling-partner-api-models/clients/sellingpartner-api-aa-java/target/sellingpartnerapi-aa-java-1.0-jar-with-dependencies.jar" -DgroupId=com.amazon.sellingpartnerapi -DartifactId=sellingpartnerapi-aa-java -Dversion=1.0 -Dpackaging=jar
echo " ############ END INSTALL HELP LIBRARY #################"
echo "       Building Swagger Code Project                  "
java -jar "${basePath}/swagger-codegen-cli.jar" generate -i "${basePath}/selling-partner-api-models/models/sellers-api-model/sellers.json" -l java -t "${basePath}/selling-partner-api-models/clients/sellingpartner-api-aa-java/resources/swagger-codegen/templates" -o "${basePath}/dist/selling-partner-client"
echo " ########## END GENERATE SWAGGER PROJECT ##############"
echo "      Adding help library into swagger project         "
java -jar "${basePath}/injectlibrary-1.0.0.jar" "${basePath}/dist/selling-partner-client/pom.xml"
echo " #### END ADDING HELP LIBRARY INTO SWAGGER PROJECT ###"
cd "${basePath}/dist/selling-partner-client"
mvn clean package
echo " #################### END SCRIPT ######################"
