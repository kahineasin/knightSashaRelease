@echo off
setlocal
 
@rem set "REPOSITORY=https://github.com/jsjolund/GdxDemo3D.git"
@rem set "DIRECTORY=example"
set "MAX_RETRIES=100"
 
:retry
@rem if exist "%DIRECTORY%" rmdir /s /q "%DIRECTORY%"
@rem git clone "%REPOSITORY%" "%DIRECTORY%"
git push
if %ERRORLEVEL% NEQ 0 (
    if %MAX_RETRIES% GTR 0 (
        set /a MAX_RETRIES-=1
        echo retry...
        timeout /t 5
        goto retry
    ) else (
        echo failed
        exit /b 1
    )
)
 
echo success
endlocal