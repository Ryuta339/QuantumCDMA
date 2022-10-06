alphas = [0.001,0.005:0.005:1];
ss = [0:0.01:1];

options = optimoptions('fsolve', 'Display', 'none', 'MaxIter', 1e3, 'TolFun', 1e-10, 'FiniteDifferenceType', 'central');
DVI = 400;
sig = 4.0;
dz = sig ./ DVI;
zz = (-DVI:1:DVI).*dz;
Dzz = normpdf(zz,0,1).*dz;

s_id = 1;
for s=ss
	op_st = zeros(3, length(alphas));
	op0 = zeros(3, 1);
	op0(1,1) = 0;
	op0(2,1) = 0;
	op0(3,1) = 0.1;
	exitflag = 1;
	alpha_id = 1;
	for alpha=alphas
		fun = @(op) saddle_point_eq(op, alpha, s, 0, zz, Dzz);
		[op_out, ~, exitflag, ~] = fsolve(fun, op0, options);
		op0 = op_out;
		op_st(:, alpha_id) = op0;
		alpha_id = alpha_id + 1;
	end
	str1 = sprintf('./results_asc/op_%d.mat', s_id);
	save_file(str1, op_st);

	op0(1,1) = 1;
	op0(2,1) = 1;
	op0(3,1) = 0.1;
	exitflag = 1;
	alpha_id = 1;
	alpha_id = length(alphas);
	for alpha=flip(alphas)
		fun = @(op) saddle_point_eq(op, alpha, s, 0, zz, Dzz);
		[op_out, ~, exitflag, ~] = fsolve(fun, op0, options);
		op0 = op_out;
		op_st(:, alpha_id) = op0;
		alpha_id = alpha_id - 1;
	end
	str1 = sprintf('./results_desc/op_%d.mat', s_id);
	save_file(str1, op_st);

	s_id = s_id + 1;
end

