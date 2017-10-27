
%% Data, here just a random matrix
con = rand(256, 256);
vio = rand(256, 256);


%% Sort data by an index that reflect amplitude in a window

% Define time window
tw = 125:150;

% Average over time window
ac = mean(vio(tw,:));
av = mean(vio(tw,:));

% Create index by sorting the averages and getting the reverse index
[s ic] = sort(ac);
[s iv] = sort(av);

% Plot to check sorted data
subplot(1,2,1)
imagesc(vio(iv, :))
title("Violation")
axis square
subplot(1,2,2)
imagesc(con(iv, :))
title("Control")
axis square




% Notes:

% - Seems like we want a function that will take vio and con from each subject along with a grouping parameter N_Trials

% - The function would then:
% a) Divide the trials (of vio and con each) into consequtive sets of N_Trials 
% b) Average each of those sets
% c) Subtract the average con from average vio
% d) Once all the averages are done, sort the sets of time series and produce a reverse index
% e) Return the time series consisting of the average difference waves and the index

% - I guess this assumes that each subjects data can be divided into consequtive sets, but we will also have to handle the cases where there are more trials in one or the other condition

% - Probably better to have a second plotting function so that the plotting and sorting/averaging are done separately

% - Also keep in mind that we ultimately want to have this in two sensors F7 and Pz - and crucially, we want to pass the index from sorted Pz into the call involving F7




