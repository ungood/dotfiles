#! /bin/awk -f

BEGIN {
    FS="\t"
}

{
    if (NR == 1) { next }
    asin = $14
    quantity = $22
    cost = $23
    rows_sum[asin] += 1
    quantity_sum[asin] += quantity
    cost_sum[asin] += (quantity * cost)
}

END {
    n = asorti(rows_sum,asins)

    print "     ASIN\tROWS\tQTY\tCOST"
    for(i=1;i<=n;i++) {
        asin = asins[i]
        rows_total += rows_sum[asin]
        quantity_total += quantity_sum[asin]
        cost_total += cost_sum[asin]
        print asin "\t\t" quantity_sum[asin] "\t" cost_sum[asin]
    }
    print "     TOTAL\t" rows_total "\t" quantity_total "\t" cost_total
}
