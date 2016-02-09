function [ w, b ] = getPrimalSVMParameters( model )

w = model.SVs' * model.sv_coef;
b = -model.rho;

if model.Label(1) == -1
    w = -w;
    b = -b;
end


end

