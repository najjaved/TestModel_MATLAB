function openRequirementsDocument()
% Utility to open the requirements document


project = currentProject;
open( fullfile(project.RootFolder, 'requirements', 'Requirements-dummy.docx') )

end
