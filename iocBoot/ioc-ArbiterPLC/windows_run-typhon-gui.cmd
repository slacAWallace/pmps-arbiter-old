
@echo Starting Typhon...

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\awallace\Documents\Source\pmps-dev-arbiter\\:/reg/g/pcds/epics/ioc/Arbiter" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/Arbiter/iocBoot/ioc-ArbiterPLC' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/Arbiter/Arbiter/Arbiter.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py"
