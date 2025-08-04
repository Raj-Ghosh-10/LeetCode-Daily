-spec total_fruit(Fruits :: [integer()]) -> integer().
total_fruit(Fruits) ->
    %% Vaiables are: F1, F2, Ind1, Ind2, CurrentInd, Count, Max
    scan_fruits(Fruits, -1, -1, 0, 0, 0, 0, 0).

%% finished scan
scan_fruits([], F1, F2, Ind1, Ind2, CurrentInd, Count, Max) -> lists:max([Count, Max]);
%% set f1
scan_fruits([F | Fruits], -1, F2, Ind1, Ind2, CurrentInd, Count, Max) when F /= F2 -> 
    scan_fruits(Fruits, F, F2, CurrentInd, Ind2, CurrentInd+1, Count+1, Max);
%% set f2
scan_fruits([F | Fruits], F1, -1, Ind1, Ind2, CurrentInd, Count, Max) when F /= F1 -> 
    scan_fruits(Fruits, F1, F, Ind1, CurrentInd, CurrentInd+1, Count+1, Max);

scan_fruits([F | Fruits], F1, F2, Ind1, Ind2, CurrentInd, Count, Max) -> 
    if 
        F /= F1 andalso F /= F2 ->
            %% Streak ended!
            %% set new max
            %% continue with num that is later
            %% reset count to Index-max_ind+1
            if Ind1 < Ind2 -> scan_fruits(Fruits, F, F2, CurrentInd, Ind2, CurrentInd+1, CurrentInd-Ind2+1, lists:max([Count, Max]));
                true -> scan_fruits(Fruits, F1, F, Ind1, CurrentInd, CurrentInd+1, CurrentInd-Ind1+1, lists:max([Count, Max]))
            end;
        F == F1 -> 
            %% update ind1 to start of current streak
            if Ind1 < Ind2 -> scan_fruits(Fruits, F1, F2, CurrentInd, Ind2, CurrentInd+1, Count+1, Max);
                true -> scan_fruits(Fruits, F1, F2, Ind1, Ind2, CurrentInd+1, Count+1, Max)
            end;
        %% F == F2
        true -> 
            %% update ind2 to start of current streak
            if Ind2 < Ind1 -> scan_fruits(Fruits, F1, F2, Ind1, CurrentInd, CurrentInd+1, Count+1, Max);
                true -> scan_fruits(Fruits, F1, F2, Ind1, Ind2, CurrentInd+1, Count+1, Max)
            end
    end.