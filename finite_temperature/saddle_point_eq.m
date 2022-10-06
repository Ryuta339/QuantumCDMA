function [out] = saddle_point_eq(op, alpha, s, beta, t0, zz, Dzz)
	len_z = length(zz);

	tmp_m = zeros(len_z, 1);
	tmp_q = zeros(len_z, 1);
	tmp_r = zeros(len_z, 1);

	Delta = op(3,1) - op(2,1);
	U = 1 + s.*beta.*Delta;
	hat_m = alpha ./ U;
	hat_q = alpha .* (op(2,1) - 2.*op(1,1) + 1 + t0 ) ./ U.^2;
	hat_Delta = hat_m * Delta;

	for jj=1:len_z
		g = hat_m + sqrt(hat_Delta) .* zz + sqrt(hat_q) .* zz(1, jj);
		sq_g = (s.*g).^2;
		tf = (1-s).^2;
		u = sqrt(sq_g + tf);
		su = sinh(beta.*u);
		cu = cosh(beta.*u);

		Y = Dzz * cu';
		m_num = s .* g .* su ./ u;
		tmp_m(jj, 1) = (Dzz * m_num') ./ Y;
		tmp_q(jj, 1) = tmp_m(jj, 1).^2;
		
		r_num = sq_g .* cu ./ u.^2 + tf .* su ./ (beta.*u.^3);
		tmp_r(jj, 1) = (Dzz * r_num') ./ Y;

	end

	out(1,1) = Dzz*tmp_m - op(1,1);
	out(2,1) = Dzz*tmp_q - op(2,1);
	out(3,1) = Dzz*tmp_r - op(3,1);
end
