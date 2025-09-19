@echo off
timeout /t 3 /nobreak >nul  
if exist "knightsasha.jar" (
    del "knightsasha_old.jar"
    ren ".\lib\knightsasha.jar" "knightsasha_old.jar"
    move ".\lib\knightsasha_old.jar" ".\"
    move "knightsasha.jar" ".\lib"
    @rem 这里可以考虑保留旧文件
    @rem del "knightsasha_old.jar"
)
@rem start javaw -jar "current-version.jar"  @rem 重启应用
start knightsasha.bat