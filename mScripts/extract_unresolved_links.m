
%modelName = 'ChargingApp';
modelName = 'etherCATmdlBasic';
LibrarayNames = '';
blockPaths = '';

% load_system(modelName);
blocks = find_system(modelName,'BlockType','Reference'); % Get a list of reference blocks paths for the model.
for ii=1:length(blocks)
    libdata = libinfo(blocks(ii)); % to get information about libraray blocks in a system
    if isempty(libdata.LinkStatus)
        continue;
    else
        
        if strcmp(libdata.LinkStatus ,'unresolved')
            LibName = libdata.Library;
            if ismember(LibName,LibrarayNames)
                continue;
            else
                LibrarayNames = [LibrarayNames , LibName, ','];
                blockPaths = [blockPaths, libdata.ReferenceBlock ,','];
        
            end

        end

    end


end


%% % sysHandle = get_param(modelName,'Handle');
% get(gcbh)  % get list of parameters for a block or a system get(sysHandle)
% Objects = find_system(System) % returns the specified system and its blocks.
% find_system(modelName,'Type','Block'); % find_system(System,Name,Value) returns the objects in the specified system/ system's handle that meet the criteria specified by one or more Name,Value pair arguments.