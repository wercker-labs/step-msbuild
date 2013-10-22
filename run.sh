if [ -n "$WERCKER_MSBUILD_CONFIGURATION" ]; then
  export MSBUILD_CONFIG="/p:Configuration=$WERCKER_MSBUILD_CONFIGURATION"
  echo "Building $WERCKER_MSBUILD_CONFIGURATION."
else
  echo "Building with default configuration."
fi

WERCKER_STEP_ROOT_WIN='c:\cygwin'$(echo $WERCKER_STEP_ROOT | sed 's/\//\\/g')
WERCKER_REPORT_ARTIFACTS_DIR_WIN='c:\cygwin'$(echo $WERCKER_REPORT_ARTIFACTS_DIR | sed 's/\//\\/g')
LOGGER_DLL=$WERCKER_STEP_ROOT_WIN'\ThoughtWorks.CruiseControl.MSBuild.dll'

LOGGER_CONFIG='/logger:'$LOGGER_DLL';'$WERCKER_REPORT_ARTIFACTS_DIR_WIN'buildresult.xml'

echo "/cygdrive/c/Windows/Microsoft.NET/Framework/v4.0.30319/MSBuild.exe $MSBUILD_CONFIG /clp:showcommandline $LOGGER_CONFIG \"$WERCKER_MSBUILD_SOLUTION\""

/cygdrive/c/Windows/Microsoft.NET/Framework/v4.0.30319/MSBuild.exe $MSBUILD_CONFIG /clp:showcommandline $LOGGER_CONFIG "$WERCKER_MSBUILD_SOLUTION"
