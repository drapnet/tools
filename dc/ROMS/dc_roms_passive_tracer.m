% adds passive tracers to initial conditions file with proper attributes

function [] = dc_roms_passive_tracer(S,tracer_names)

for i=1:S.NPT
    varname = sprintf('dye_%02d',i);
    
    % create variable
    nccreate(S.ncname,varname,'Dimensions',{'xi_rho' S.Lm+2 'eta_rho' S.Mm+2 's_rho' S.N 'ocean_time'});
    
    % add attributes
    if isempty(tracer_names)
        ncwriteatt(S.ncname,varname,'long_name',['Passive Tracer ' num2str(i)]);
    else
        ncwriteatt(S.ncname,varname,'long_name',tracer_names{i});
    end
    
    ncwriteatt(S.ncname,varname,'units','kilogram meter-3');
    ncwriteatt(S.ncname,varname,'time','ocean_time');
    ncwriteatt(S.ncname,varname,'coordinates', 'xi_rho eta_rho s_rho ocean_time');
end