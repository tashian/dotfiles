function stepswitch
    if test "$argv" = "brew"
        rm /usr/local/bin/step
        brew unlink step && brew link step
    else
        pushd /usr/local/bin
        ln -fs step-$argv step
        popd
    end
end

