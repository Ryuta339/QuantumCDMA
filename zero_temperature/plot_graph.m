alphas = [0.001,0.005:0.005:1];
ss = [0:0.01:1];

for idx=1:1
	asc = zeros(length(ss), length(alphas));
	desc = zeros(length(ss), length(alphas));
	
	for s_id=1:length(ss)
		str1 = sprintf('./results_asc/op_%d.mat', s_id);
		op_st = load(str1);
		op_asc = op_st.mat1;
		asc(s_id, :) = op_asc(idx, :);

		str1 = sprintf('./results_desc/op_%d.mat', s_id);
		op_st = load(str1);
		op_desc = op_st.mat1;
		desc(s_id, :) = op_desc(idx, :);
	end

	[AA, SS] = meshgrid(alphas, ss);

	figure
	subplot(4, 2, 1);
	contourf(AA, SS, real(asc), linspace(0, 1, 101), 'LineStyle', 'none');
	colorbar;
	title('asc');

	subplot(4, 2, 2);
	contourf(AA, SS, real(desc), linspace(0, 1, 101), 'LineStyle', 'none');
	colorbar;
	title('desc');

	subplot(4, 2, 3);
	plot(alphas, real(asc));
	ylim([0 1.5]);

	subplot(4, 2, 4);
	plot(alphas, real(desc));
	ylim([0 1.5]);

	subplot(4, 1, 3);
	contourf(AA, SS, real(desc) - real(asc), linspace(-0.01,1,102), 'LineStyle', 'none');
	colorbar;

	subplot(4, 1, 4);
	plot(alphas, real(asc(96, :)));
	hold on;
	plot(alphas, real(desc(96, :)));
end
ss(96)
