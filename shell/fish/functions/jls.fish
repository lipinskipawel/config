function jls
  set --local jdkList (ls -N $HOME/.jdks)
  if test (count $jdkList) = 0
    echo "Download jdk and unpack it to:" $HOME/.jdks
  end
  for jdk in $jdkList
    echo $jdk
  end
end

