@ECHO OFF

SET srcFolder=%1
SET srcFile=%2
SET srcExt=%3
SET appFolder=%4
SET appString=%5
SET classFolder=%6
SET classString=%7

CALL SET appCheck=%%srcFolder:%appString%=%%
CALL SET classCheck=%%srcFolder:%classString%=%%

IF %srcExt%==.php (

	IF NOT %srcFolder%==%appCheck% (

		CALL SET targetFolder=%appFolder%

	) ELSE IF NOT %srcFolder%==%classCheck% (

		CALL SET targetFolder=%classFolder%

	) ELSE goto :invalid

) ELSE goto :invalid

robocopy %srcFolder% %targetFolder% %srcFile%%srcExt% /is /it

GOTO :end

:invalid

ECHO The source file is invalid.

PAUSE

:end
