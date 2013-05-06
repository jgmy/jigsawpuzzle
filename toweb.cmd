for %%A in (chrome, openwebapp, webapp) do xcopy /S %%A ..\jigsawpuzzle-web\%%A 

type openwebapp\manifest.webapp|sed -e "s!/varios/jigsaw_owapp/!/jigsawpuzzle/openwebapp/!">..\jigsawpuzzle-web\openwebapp\manifest.webapp
