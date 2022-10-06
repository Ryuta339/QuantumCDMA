# CDMA の量子アニーリング

## 有限温度の鞍点方程式

$$
\begin{align}
	m =& \int Dz Y^{-1} \int Dy \cfrac{sg}{u} \sinh \beta u \\
	q =& \int Dz \left\{ Y^{-1} \int Dy \cfrac{sg}{u} \sinh \beta u \right\}^2 \\
	R =& \int Dz Y^{-1} \int Dy \left\{ \cfrac{s^2g^2}{u^2} \cosh \beta u + \cfrac{(1-s)^2}{\beta u^3}\sinh \beta u \right\} \\
	\hat{m} =& \cfrac{\alpha}{U} \\
	\hat{q} =& \cfrac{\alpha(q - 2m + 1 + \beta_0^{-1})}{U^2} \\
	\hat{\Delta} =& \hat{m}\Delta \\
	\Delta =& R - q \\
	U =& 1 + \beta s \Delta \\
	g =& \hat{m} + \sqrt{\hat{\Delta}} y + \sqrt{\hat{q}} z \\
	u =& \sqrt{s^2g^2 + (1-s)^2} \\
	Y =& \int Dy \cosh \beta u
\end{align}
$$


## ゼロ温度極限の鞍点方程式

$$
\begin{align}
	m =& \int Dz \cfrac{h}{\sqrt{h^2 + (1-s)^2}} \\
	q =& \int Dz \cfrac{h^2}{h^2 + (1-s)^2} \\
	C =& s(1-s)^2 \int Dz \cfrac{1}{\{h^2+(1-s)^2\}^{3/2}} \\
	\hat{m} =& \cfrac{\alpha}{U} \\
	\hat{q} =& \cfrac{\alpha (q - 2m + 1 + \beta_0^{-1})}{U^2} \\
	U =& 1 + C \\
	h =& s(\hat{m} + \sqrt{q}z)
\end{align}
$$
