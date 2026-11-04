%% Define subject
patients = [12,19,20,21,22,23,24,25,26,28,27,29,30,31,32,33,34,35,36,37,38,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60];

%% Run GUI for all subjects that have gui data saved
for i = 1
    subj_num = patients(i);
    datapath = "/Users/miljaharju/seegartefacts/samples/Pat" + string(subj_num) +'.mat'; % good_channels or all_channels

    if ~isfile(datapath); warning('No GUI data for patient %d, skipping.', subj_num); continue; end % no samples found, check path
    S = load(datapath);
    if all(cellfun(@double, S.gui_data.info(:,6)) > 0); continue; end          % everything labeled already

    %labelSignals(datapath); % default settings

    % if signal is not 9cm, measure the screen and put the result to the
    % last (6th) argument and use the call below
    labelSignals(datapath, [], 2048, true, true, 6.75) % 6.75cm on my laptop

    % show labels
    fprintf("Labels saved:\n\n")
    S = load(datapath);
    disp(S.gui_data.info)
end
