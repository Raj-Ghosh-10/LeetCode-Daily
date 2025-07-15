-spec is_valid(Word :: unicode:unicode_binary()) -> boolean().
is_valid(Word) when size(Word) < 3 -> false;
is_valid(Word) ->
    scan_for_cond(binary_to_list(Word), false, false, false)
  .
%% finished scan
scan_for_cond([], Vowel, Const, Special) -> Vowel andalso Const andalso not Special;
%% special chars case 
scan_for_cond([H | Rest], Vowel, Const, Special) when H==$@ orelse  H==$# orelse  H==$$ ->
    scan_for_cond(Rest, Vowel, Const, true);
%% vowels, lower/upper cases
scan_for_cond([H | Rest], Vowel, Const, Special) when H==$a orelse H==$e orelse H==$i orelse H==$o orelse H==$u orelse H==$A orelse H==$E orelse H==$I orelse H==$O orelse H==$U ->
    scan_for_cond(Rest, true, Const, Special);
%% numbers do not count for conditions
scan_for_cond([H | Rest], Vowel, Const, Special) when H==$0 orelse H==$1 orelse H==$2 orelse H==$3 orelse H==$4 orelse H==$5 orelse H==$6 orelse H==$7 orelse H==$8 orelse H==$9 ->
    scan_for_cond(Rest, Vowel, Const, Special);
%% only other chars are constants
scan_for_cond([H | Rest], Vowel, Const, Special) -> scan_for_cond(Rest, Vowel, true, Special).