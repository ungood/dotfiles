#! /bin/awk -f

BEGIN {
    alarm=0
    breaches=0
    max_breaches=0
}

{
    if($5 > threshold) {
        breaches = breaches + 1
        alarm = 1
        print breaches " " $5
    } else {
        if(alarm == 1) {
            if(max_breaches < breaches)
                max_breaches = breaches
        }
        breaches = 0
        alarm = 0
    }
}

END {
    if(max_breaches < breaches)
        max_breaches = breaches
    print max_breaches
}
