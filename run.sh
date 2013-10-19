if [ -n "$WERCKER_MSBUILD_CONFIGURATION" ]; then
  export MSBUILD_CONFIG="/p:Configuration=$WERCKER_MSBUILD_CONFIGURATION"
  echo "Building $WERCKER_MSBUILD_CONFIGURATION."
else
  echo "Building with default configuration."
fi

/cygdrive/c/Windows/Microsoft.NET/Framework/v4.0.30319/MSBuild.exe $MSBUILD_CONFIG $WERCKER_MSBUILD_SOLUTION
