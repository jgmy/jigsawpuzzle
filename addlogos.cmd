rem overwrite placeholder icons inserted by Scirra Construct2
for %%A in (16,32,64,128) do if exist chrome\icon_%%A.png copy Icon_Puzzle_%%A.png chrome\icon_%%A.png
for %%A in (16,32,64,128) do if exist webapp\icon_%%A.png copy Icon_Puzzle_%%A.png webapp\icon_%%A.png
for %%A in (16,32,64,128) do if exist openwebapp\icon_%%A.png copy Icon_Puzzle_%%A.png openwebapp\icon_%%A.png
for %%A in (chrome, webapp, openwebapp) do if exist %%A\logo.png copy Icon_Puzzle_64.png %%A\logo.png
for %%A in (chrome,webapp,openwebapp) do if exist %%A\*.* copy fruhling_bluhender_kirschenbaum.jpg %%A\

rem modify chrome manifests
rem detect if already modified
find "__MSG_" chrome\manifest.json
if errorlevel 1 goto :chrome1
goto :chrome2
:chrome1
for %%A in (json.c2, j.son) do if exist chrome\manifest.%%A del chrome\manifest.%%A
sed -f chrome\internationalize.sed <chrome\manifest.json >chrome\manifest.j.son
ren manifest.json.c2 == Manifest as Construct2 output.
ren chrome\manifest.json manifest.json.c2
ren manifest.json == Modified manifest.
ren chrome\manifest.j.son manifest.json
:chrome2

rem delete BOM mark from openwebapp:
sed -e "1s/^.*{/{/" openwebapp\manifest.webapp >openwebapp\manifest.nobom
del openwebapp\manifest.webapp
ren openwebapp\manifest.nobom manifest.webapp