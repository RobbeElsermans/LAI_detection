function hidden_leave_factor = FindHiddenLeaveFactor(z_distance, hidden_leave_thresh, param_1)
% Determine the hidden leave value.
% If the total z_distance is higher then 0.15, then we have probably hidden
% leaves

    % param_1 = 10;
    hidden_leave_factor = 1; % default, we have no hidden leaves

    if z_distance > hidden_leave_thresh
        hidden_leave_factor = (z_distance/(hidden_leave_thresh*param_1))+1; % +1 om ervoor te zorgen dat de factor erbij komt i.p.v. er af gaat
    end
end
