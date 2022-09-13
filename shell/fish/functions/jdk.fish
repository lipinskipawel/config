function jdk
  if test (count $argv) = 0
    echo "Use jls to find installed java versions"
    echo "Provide name of java version from jls output"
    echo ""
    echo "Example: jdk openjdk-17"
    return 1
  end
  if not test -d $HOME/.jdks/$argv[1]
    echo "Directory does not exists: $HOME/.jdks/$argv[1]"
    return 1
  end

  set --local TARGET_JDK_BIN $HOME/.jdks/$argv[1]/bin
  for binaries in  (ls -N $TARGET_JDK_BIN)
    set --local TARGET $HOME/.jdks/$argv[1]/bin/$binaries
    set --local DIRECTORY $HOME/.local/bin/$binaries
    rm -rf $DIRECTORY
    ln -sr $TARGET $DIRECTORY
  end
  java -version
end

