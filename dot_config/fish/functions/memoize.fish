function __memoize_underlying_fn --argument-names funcname
    echo '__memoize_'$funcname
end

begin
    set --local memoize_keys
    set --local memoize_values
    function memoize --argument-names funcname
        set --local memofn (__memoize_underlying_fn $funcname)
        functions --copy $funcname $memofn
        function $funcname
            # See https://stackoverflow.com/a/40019138/12638282
            set --local fn (__memoize_underlying_fn (status function))
            set --local key $fn'/'$argv # / is an invalid function character in fish
            if set --local index (contains -i -- $key $memoize_keys)
                echo $__memoize_values[$index]
            else
                set --local value ($fn $argv)
                set --append memoize_keys $key
                set --append memoize_values $value
                echo $value
            end
        end
    end
end