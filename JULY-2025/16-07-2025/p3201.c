int maximumLength(int* nums, int numsSize) {
    if (numsSize == 0) {
        return 0;
    }
    if (numsSize == 1) {
        return 1;
    }

    int dp_even_sum_even_end = 0;
    int dp_even_sum_odd_end = 0;

    int dp_odd_sum_even_end = 0;
    int dp_odd_sum_odd_end = 0;

    int overall_max_len = 0;

    for (int l = 0; l < numsSize; l++) {
        int current_val_l = nums[l];
        int current_parity_l = current_val_l % 2;

        if (current_parity_l == 0) {
            dp_even_sum_even_end = (dp_even_sum_even_end > 0 ? dp_even_sum_even_end : 0) + 1;
            dp_odd_sum_even_end = (dp_odd_sum_odd_end > 0 ? dp_odd_sum_odd_end : 0) + 1;
        } else {
            dp_even_sum_odd_end = (dp_even_sum_odd_end > 0 ? dp_even_sum_odd_end : 0) + 1;
            dp_odd_sum_odd_end = (dp_odd_sum_even_end > 0 ? dp_odd_sum_even_end : 0) + 1;
        }
    }

    int max_even_sum_len = 0;
    if (dp_even_sum_even_end > max_even_sum_len) {
        max_even_sum_len = dp_even_sum_even_end;
    }
    if (dp_even_sum_odd_end > max_even_sum_len) {
        max_even_sum_len = dp_even_sum_odd_end;
    }

    int max_odd_sum_len = 0;
    if (dp_odd_sum_even_end > max_odd_sum_len) {
        max_odd_sum_len = dp_odd_sum_even_end;
    }
    if (dp_odd_sum_odd_end > max_odd_sum_len) {
        max_odd_sum_len = dp_odd_sum_odd_end;
    }

    overall_max_len = max_even_sum_len > max_odd_sum_len ? max_even_sum_len : max_odd_sum_len;
    
    return overall_max_len;
}