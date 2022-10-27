mystr = '';

for ii=1:70
    mystr = [mystr ,'''','PDO',num2str(ii),'''',',','''','myvar',num2str(ii),'''',',','''','single','''',';'];
end

blockPath = 'etherCATmdl/IO750/ECS Setup v2 ';
blockHandle = get_param(blockPath,'Handle');
set_param(blockHandle,'txPdoMapping',['{',mystr,'}']);

%% Rx Side
mystr1 = '';

for jj=1:62
    mystr1 = [mystr1 ,'''','Rx',num2str(jj),'''',',','''','myvar',num2str(jj),'''',',','''','double','''',';'];
end

blockPath1 = 'etherCATmdl/IO750/ECS Setup v2 ';
blockHandle1 = get_param(blockPath1,'Handle');
set_param(blockHandle1,'rxPdoMapping',['{',mystr1,'}']);