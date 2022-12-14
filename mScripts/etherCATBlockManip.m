modelName = 'etherCATmdlBasic';
load_system(modelName);
%SolverType = get_param(modelName, 'SolverType');

%% Tx PDO side
mystr = '';

for ii=1:32
    mystr = [mystr ,'''','TxPDO',num2str(ii),'''',',','''','myvar',num2str(ii),'''',',','''','single','''',';'];
end

blockPath = [modelName, '/IO750/ECS Setup v2 '];
blockHandle = get_param(blockPath,'Handle');  % OR getSimulinkBlockHandle(blockPath)
% get_param(blockPath,'DialogParameters');
set_param(blockHandle,'txPdoMapping',['{',mystr,'}']);
% Get the value for the txPdoMapping block parameter.
get_param(blockPath,'txPdoMapping');

%% Rx PDO side
mystr1 = '';

for jj=1:4
    mystr1 = [mystr1 ,'''','RxPDO',num2str(jj),'''',',','''','myvar',num2str(jj),'''',',','''','double','''',';'];
end

blockPath1 = [modelName, '/IO750/ECS Setup v2 '];
blockHandle1 = get_param(blockPath1,'Handle');
set_param(blockHandle1,'rxPdoMapping',['{',mystr1,'}']);

%% update block diagram
set_param(model,'SimulationCommand','Update');

% Get a list of block paths and names for the model.
% find_system(modelName,'Type','Block')