       БK"	  @ыAоAbrain.Event:2СM`Хч     !ЎмR	кд{ыAоA"ЬФ
e
PlaceholderPlaceholder*
dtype0*
shape: */
_output_shapes
:           
P
Placeholder_1Placeholder*
dtype0*
shape: *
_output_shapes
:
U
one_hot/on_valueConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
V
one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
O
one_hot/depthConst*
dtype0*
value	B :+*
_output_shapes
: 
ќ
one_hotOneHotPlaceholder_1one_hot/depthone_hot/on_valueone_hot/off_value*
axis         *
T0*
_output_shapes
:*
TI0
z
!Layer1ConV/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
e
 Layer1ConV/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer1ConV/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
И
+Layer1ConV/truncated_normal/TruncatedNormalTruncatedNormal!Layer1ConV/truncated_normal/shape*
seed2 *

seed *
dtype0*&
_output_shapes
:*
T0
е
Layer1ConV/truncated_normal/mulMul+Layer1ConV/truncated_normal/TruncatedNormal"Layer1ConV/truncated_normal/stddev*
T0*&
_output_shapes
:
ќ
Layer1ConV/truncated_normalAddLayer1ConV/truncated_normal/mul Layer1ConV/truncated_normal/mean*
T0*&
_output_shapes
:
Ћ
Layer1ConV/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
п
Layer1ConV/Variable/AssignAssignLayer1ConV/VariableLayer1ConV/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
њ
Layer1ConV/Variable/readIdentityLayer1ConV/Variable*
T0*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
s
Layer1ConV/conv1_w_smry/tagConst*
dtype0*(
valueB BLayer1ConV/conv1_w_smry*
_output_shapes
: 
Ѓ
Layer1ConV/conv1_w_smryHistogramSummaryLayer1ConV/conv1_w_smry/tagLayer1ConV/Variable/read*
T0*
_output_shapes
: 
]
Layer1ConV/zerosConst*
dtype0*
valueB*    *
_output_shapes
:

Layer1ConV/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
К
Layer1ConV/Variable_1/AssignAssignLayer1ConV/Variable_1Layer1ConV/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
ї
Layer1ConV/Variable_1/readIdentityLayer1ConV/Variable_1*
T0*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
н
Layer1ConV/Conv2DConv2DPlaceholderLayer1ConV/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         *
T0*
paddingVALID*
strides

~
Layer1ConV/addAddLayer1ConV/Conv2DLayer1ConV/Variable_1/read*
T0*/
_output_shapes
:         
a
Layer1ConV/ReluReluLayer1ConV/add*
T0*/
_output_shapes
:         
╗
Layer1ConV/MaxPoolMaxPoolLayer1ConV/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

z
!Layer2ConV/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
e
 Layer2ConV/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer2ConV/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
И
+Layer2ConV/truncated_normal/TruncatedNormalTruncatedNormal!Layer2ConV/truncated_normal/shape*
seed2 *

seed *
dtype0*&
_output_shapes
:*
T0
е
Layer2ConV/truncated_normal/mulMul+Layer2ConV/truncated_normal/TruncatedNormal"Layer2ConV/truncated_normal/stddev*
T0*&
_output_shapes
:
ќ
Layer2ConV/truncated_normalAddLayer2ConV/truncated_normal/mul Layer2ConV/truncated_normal/mean*
T0*&
_output_shapes
:
Ћ
Layer2ConV/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
п
Layer2ConV/Variable/AssignAssignLayer2ConV/VariableLayer2ConV/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
њ
Layer2ConV/Variable/readIdentityLayer2ConV/Variable*
T0*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
s
Layer2ConV/conv2_w_smry/tagConst*
dtype0*(
valueB BLayer2ConV/conv2_w_smry*
_output_shapes
: 
Ѓ
Layer2ConV/conv2_w_smryHistogramSummaryLayer2ConV/conv2_w_smry/tagLayer2ConV/Variable/read*
T0*
_output_shapes
: 
]
Layer2ConV/zerosConst*
dtype0*
valueB*    *
_output_shapes
:

Layer2ConV/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
К
Layer2ConV/Variable_1/AssignAssignLayer2ConV/Variable_1Layer2ConV/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
ї
Layer2ConV/Variable_1/readIdentityLayer2ConV/Variable_1*
T0*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
█
Layer2ConV/Conv2DConv2DLayer1ConV/MaxPoolLayer2ConV/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

~
Layer2ConV/addAddLayer2ConV/Conv2DLayer2ConV/Variable_1/read*
T0*/
_output_shapes
:         


a
Layer2ConV/ReluReluLayer2ConV/add*
T0*/
_output_shapes
:         


╗
Layer2ConV/MaxPoolMaxPoolLayer2ConV/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

q
 Layer2ConV/Flatten/Reshape/shapeConst*
dtype0*
valueB"    љ  *
_output_shapes
:
ю
Layer2ConV/Flatten/ReshapeReshapeLayer2ConV/MaxPool Layer2ConV/Flatten/Reshape/shape*
T0*(
_output_shapes
:         љ*
Tshape0
q
 Layer3FC1/truncated_normal/shapeConst*
dtype0*
valueB"љ  x   *
_output_shapes
:
d
Layer3FC1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
f
!Layer3FC1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
»
*Layer3FC1/truncated_normal/TruncatedNormalTruncatedNormal Layer3FC1/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes
:	љx*
T0
ъ
Layer3FC1/truncated_normal/mulMul*Layer3FC1/truncated_normal/TruncatedNormal!Layer3FC1/truncated_normal/stddev*
T0*
_output_shapes
:	љx
ї
Layer3FC1/truncated_normalAddLayer3FC1/truncated_normal/mulLayer3FC1/truncated_normal/mean*
T0*
_output_shapes
:	љx
є
Layer3FC1/VariableVariable*
dtype0*
	container *
shared_name *
shape:	љx*
_output_shapes
:	љx
═
Layer3FC1/Variable/AssignAssignLayer3FC1/VariableLayer3FC1/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
ѕ
Layer3FC1/Variable/readIdentityLayer3FC1/Variable*
T0*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
m
Layer3FC1/fc1_W_smry/tagConst*
dtype0*%
valueB BLayer3FC1/fc1_W_smry*
_output_shapes
: 
|
Layer3FC1/fc1_W_smryHistogramSummaryLayer3FC1/fc1_W_smry/tagLayer3FC1/Variable/read*
T0*
_output_shapes
: 
\
Layer3FC1/zerosConst*
dtype0*
valueBx*    *
_output_shapes
:x
~
Layer3FC1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:x*
_output_shapes
:x
├
Layer3FC1/Variable_1/AssignAssignLayer3FC1/Variable_1Layer3FC1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Ѕ
Layer3FC1/Variable_1/readIdentityLayer3FC1/Variable_1*
T0*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Д
Layer3FC1/MatMulMatMulLayer2ConV/Flatten/ReshapeLayer3FC1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         x
s
Layer3FC1/addAddLayer3FC1/MatMulLayer3FC1/Variable_1/read*
T0*'
_output_shapes
:         x
W
Layer3FC1/ReluReluLayer3FC1/add*
T0*'
_output_shapes
:         x
q
 Layer4FC2/truncated_normal/shapeConst*
dtype0*
valueB"x   T   *
_output_shapes
:
d
Layer4FC2/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
f
!Layer4FC2/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
«
*Layer4FC2/truncated_normal/TruncatedNormalTruncatedNormal Layer4FC2/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes

:xT*
T0
Ю
Layer4FC2/truncated_normal/mulMul*Layer4FC2/truncated_normal/TruncatedNormal!Layer4FC2/truncated_normal/stddev*
T0*
_output_shapes

:xT
І
Layer4FC2/truncated_normalAddLayer4FC2/truncated_normal/mulLayer4FC2/truncated_normal/mean*
T0*
_output_shapes

:xT
ё
Layer4FC2/VariableVariable*
dtype0*
	container *
shared_name *
shape
:xT*
_output_shapes

:xT
╠
Layer4FC2/Variable/AssignAssignLayer4FC2/VariableLayer4FC2/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Є
Layer4FC2/Variable/readIdentityLayer4FC2/Variable*
T0*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
m
Layer4FC2/fc2_W_smry/tagConst*
dtype0*%
valueB BLayer4FC2/fc2_W_smry*
_output_shapes
: 
|
Layer4FC2/fc2_W_smryHistogramSummaryLayer4FC2/fc2_W_smry/tagLayer4FC2/Variable/read*
T0*
_output_shapes
: 
\
Layer4FC2/zerosConst*
dtype0*
valueBT*    *
_output_shapes
:T
~
Layer4FC2/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:T*
_output_shapes
:T
├
Layer4FC2/Variable_1/AssignAssignLayer4FC2/Variable_1Layer4FC2/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
Ѕ
Layer4FC2/Variable_1/readIdentityLayer4FC2/Variable_1*
T0*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
Џ
Layer4FC2/MatMulMatMulLayer3FC1/ReluLayer4FC2/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         T
s
Layer4FC2/addAddLayer4FC2/MatMulLayer4FC2/Variable_1/read*
T0*'
_output_shapes
:         T
W
Layer4FC2/ReluReluLayer4FC2/add*
T0*'
_output_shapes
:         T
p
Layer5FC/truncated_normal/shapeConst*
dtype0*
valueB"T   +   *
_output_shapes
:
c
Layer5FC/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
e
 Layer5FC/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
г
)Layer5FC/truncated_normal/TruncatedNormalTruncatedNormalLayer5FC/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes

:T+*
T0
џ
Layer5FC/truncated_normal/mulMul)Layer5FC/truncated_normal/TruncatedNormal Layer5FC/truncated_normal/stddev*
T0*
_output_shapes

:T+
ѕ
Layer5FC/truncated_normalAddLayer5FC/truncated_normal/mulLayer5FC/truncated_normal/mean*
T0*
_output_shapes

:T+
Ѓ
Layer5FC/VariableVariable*
dtype0*
	container *
shared_name *
shape
:T+*
_output_shapes

:T+
╚
Layer5FC/Variable/AssignAssignLayer5FC/VariableLayer5FC/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
ё
Layer5FC/Variable/readIdentityLayer5FC/Variable*
T0*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
k
Layer5FC/fc3_W_smry/tagConst*
dtype0*$
valueB BLayer5FC/fc3_W_smry*
_output_shapes
: 
y
Layer5FC/fc3_W_smryHistogramSummaryLayer5FC/fc3_W_smry/tagLayer5FC/Variable/read*
T0*
_output_shapes
: 
[
Layer5FC/zerosConst*
dtype0*
valueB+*    *
_output_shapes
:+
}
Layer5FC/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:+*
_output_shapes
:+
┐
Layer5FC/Variable_1/AssignAssignLayer5FC/Variable_1Layer5FC/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
є
Layer5FC/Variable_1/readIdentityLayer5FC/Variable_1*
T0*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
Ў
Layer5FC/MatMulMatMulLayer4FC2/ReluLayer5FC/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         +
p
Layer5FC/addAddLayer5FC/MatMulLayer5FC/Variable_1/read*
T0*'
_output_shapes
:         +
M
lossss/RankConst*
dtype0*
value	B :*
_output_shapes
: 
X
lossss/ShapeShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
O
lossss/Rank_1Const*
dtype0*
value	B :*
_output_shapes
: 
Z
lossss/Shape_1ShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
N
lossss/Sub/yConst*
dtype0*
value	B :*
_output_shapes
: 
O

lossss/SubSublossss/Rank_1lossss/Sub/y*
T0*
_output_shapes
: 
`
lossss/Slice/beginPack
lossss/Sub*
N*
T0*
_output_shapes
:*

axis 
[
lossss/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
~
lossss/SliceSlicelossss/Shape_1lossss/Slice/beginlossss/Slice/size*
Index0*
T0*
_output_shapes
:
Z
lossss/concat/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
i
lossss/concat/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ё
lossss/concatConcatlossss/concat/concat_dimlossss/concat/values_0lossss/Slice*
N*
T0*
_output_shapes
:

lossss/ReshapeReshapeLayer5FC/addlossss/concat*
T0*0
_output_shapes
:                  *
Tshape0
?
lossss/Rank_2Rankone_hot*
T0*
_output_shapes
: 
^
lossss/Shape_2Shapeone_hot*
T0*
out_type0*#
_output_shapes
:         
P
lossss/Sub_1/yConst*
dtype0*
value	B :*
_output_shapes
: 
S
lossss/Sub_1Sublossss/Rank_2lossss/Sub_1/y*
T0*
_output_shapes
: 
d
lossss/Slice_1/beginPacklossss/Sub_1*
N*
T0*
_output_shapes
:*

axis 
]
lossss/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ё
lossss/Slice_1Slicelossss/Shape_2lossss/Slice_1/beginlossss/Slice_1/size*
Index0*
T0*
_output_shapes
:
\
lossss/concat_1/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
k
lossss/concat_1/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ї
lossss/concat_1Concatlossss/concat_1/concat_dimlossss/concat_1/values_0lossss/Slice_1*
N*
T0*
_output_shapes
:
~
lossss/Reshape_1Reshapeone_hotlossss/concat_1*
T0*0
_output_shapes
:                  *
Tshape0
▒
$lossss/SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogitslossss/Reshapelossss/Reshape_1*
T0*?
_output_shapes-
+:         :                  
P
lossss/Sub_2/yConst*
dtype0*
value	B :*
_output_shapes
: 
Q
lossss/Sub_2Sublossss/Ranklossss/Sub_2/y*
T0*
_output_shapes
: 
^
lossss/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
c
lossss/Slice_2/sizePacklossss/Sub_2*
N*
T0*
_output_shapes
:*

axis 
І
lossss/Slice_2Slicelossss/Shapelossss/Slice_2/beginlossss/Slice_2/size*
Index0*
T0*#
_output_shapes
:         
Ї
lossss/Reshape_2Reshape$lossss/SoftmaxCrossEntropyWithLogitslossss/Slice_2*
T0*#
_output_shapes
:         *
Tshape0
V
lossss/ConstConst*
dtype0*
valueB: *
_output_shapes
:
q
lossss/MeanMeanlossss/Reshape_2lossss/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
Y
lossss/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
[
lossss/gradients/ConstConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
n
lossss/gradients/FillFilllossss/gradients/Shapelossss/gradients/Const*
T0*
_output_shapes
: 
y
/lossss/gradients/lossss/Mean_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:
»
)lossss/gradients/lossss/Mean_grad/ReshapeReshapelossss/gradients/Fill/lossss/gradients/lossss/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
w
'lossss/gradients/lossss/Mean_grad/ShapeShapelossss/Reshape_2*
T0*
out_type0*
_output_shapes
:
┬
&lossss/gradients/lossss/Mean_grad/TileTile)lossss/gradients/lossss/Mean_grad/Reshape'lossss/gradients/lossss/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         
y
)lossss/gradients/lossss/Mean_grad/Shape_1Shapelossss/Reshape_2*
T0*
out_type0*
_output_shapes
:
l
)lossss/gradients/lossss/Mean_grad/Shape_2Const*
dtype0*
valueB *
_output_shapes
: 
q
'lossss/gradients/lossss/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
└
&lossss/gradients/lossss/Mean_grad/ProdProd)lossss/gradients/lossss/Mean_grad/Shape_1'lossss/gradients/lossss/Mean_grad/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
s
)lossss/gradients/lossss/Mean_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
─
(lossss/gradients/lossss/Mean_grad/Prod_1Prod)lossss/gradients/lossss/Mean_grad/Shape_2)lossss/gradients/lossss/Mean_grad/Const_1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
m
+lossss/gradients/lossss/Mean_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 
г
)lossss/gradients/lossss/Mean_grad/MaximumMaximum(lossss/gradients/lossss/Mean_grad/Prod_1+lossss/gradients/lossss/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
Ц
*lossss/gradients/lossss/Mean_grad/floordivDiv&lossss/gradients/lossss/Mean_grad/Prod)lossss/gradients/lossss/Mean_grad/Maximum*
T0*
_output_shapes
: 
і
&lossss/gradients/lossss/Mean_grad/CastCast*lossss/gradients/lossss/Mean_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 
«
)lossss/gradients/lossss/Mean_grad/truedivDiv&lossss/gradients/lossss/Mean_grad/Tile&lossss/gradients/lossss/Mean_grad/Cast*
T0*#
_output_shapes
:         
љ
,lossss/gradients/lossss/Reshape_2_grad/ShapeShape$lossss/SoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
╬
.lossss/gradients/lossss/Reshape_2_grad/ReshapeReshape)lossss/gradients/lossss/Mean_grad/truediv,lossss/gradients/lossss/Reshape_2_grad/Shape*
T0*#
_output_shapes
:         *
Tshape0
І
lossss/gradients/zeros_like	ZerosLike&lossss/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
ћ
Ilossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
dtype0*
valueB :
         *
_output_shapes
: 
ї
Elossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims.lossss/gradients/lossss/Reshape_2_grad/ReshapeIlossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*

Tdim0*'
_output_shapes
:         
№
>lossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/mulMulElossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims&lossss/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
v
*lossss/gradients/lossss/Reshape_grad/ShapeShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
с
,lossss/gradients/lossss/Reshape_grad/ReshapeReshape>lossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/mul*lossss/gradients/lossss/Reshape_grad/Shape*
T0*'
_output_shapes
:         +*
Tshape0
w
(lossss/gradients/Layer5FC/add_grad/ShapeShapeLayer5FC/MatMul*
T0*
out_type0*
_output_shapes
:
t
*lossss/gradients/Layer5FC/add_grad/Shape_1Const*
dtype0*
valueB:+*
_output_shapes
:
С
8lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgsBroadcastGradientArgs(lossss/gradients/Layer5FC/add_grad/Shape*lossss/gradients/Layer5FC/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Н
&lossss/gradients/Layer5FC/add_grad/SumSum,lossss/gradients/lossss/Reshape_grad/Reshape8lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
К
*lossss/gradients/Layer5FC/add_grad/ReshapeReshape&lossss/gradients/Layer5FC/add_grad/Sum(lossss/gradients/Layer5FC/add_grad/Shape*
T0*'
_output_shapes
:         +*
Tshape0
┘
(lossss/gradients/Layer5FC/add_grad/Sum_1Sum,lossss/gradients/lossss/Reshape_grad/Reshape:lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
└
,lossss/gradients/Layer5FC/add_grad/Reshape_1Reshape(lossss/gradients/Layer5FC/add_grad/Sum_1*lossss/gradients/Layer5FC/add_grad/Shape_1*
T0*
_output_shapes
:+*
Tshape0
Ќ
3lossss/gradients/Layer5FC/add_grad/tuple/group_depsNoOp+^lossss/gradients/Layer5FC/add_grad/Reshape-^lossss/gradients/Layer5FC/add_grad/Reshape_1
џ
;lossss/gradients/Layer5FC/add_grad/tuple/control_dependencyIdentity*lossss/gradients/Layer5FC/add_grad/Reshape4^lossss/gradients/Layer5FC/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         +*=
_class3
1/loc:@lossss/gradients/Layer5FC/add_grad/Reshape
Њ
=lossss/gradients/Layer5FC/add_grad/tuple/control_dependency_1Identity,lossss/gradients/Layer5FC/add_grad/Reshape_14^lossss/gradients/Layer5FC/add_grad/tuple/group_deps*
T0*
_output_shapes
:+*?
_class5
31loc:@lossss/gradients/Layer5FC/add_grad/Reshape_1
с
,lossss/gradients/Layer5FC/MatMul_grad/MatMulMatMul;lossss/gradients/Layer5FC/add_grad/tuple/control_dependencyLayer5FC/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         T
н
.lossss/gradients/Layer5FC/MatMul_grad/MatMul_1MatMulLayer4FC2/Relu;lossss/gradients/Layer5FC/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:T+
ъ
6lossss/gradients/Layer5FC/MatMul_grad/tuple/group_depsNoOp-^lossss/gradients/Layer5FC/MatMul_grad/MatMul/^lossss/gradients/Layer5FC/MatMul_grad/MatMul_1
ц
>lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer5FC/MatMul_grad/MatMul7^lossss/gradients/Layer5FC/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:         T*?
_class5
31loc:@lossss/gradients/Layer5FC/MatMul_grad/MatMul
А
@lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer5FC/MatMul_grad/MatMul_17^lossss/gradients/Layer5FC/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:T+*A
_class7
53loc:@lossss/gradients/Layer5FC/MatMul_grad/MatMul_1
╗
-lossss/gradients/Layer4FC2/Relu_grad/ReluGradReluGrad>lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependencyLayer4FC2/Relu*
T0*'
_output_shapes
:         T
y
)lossss/gradients/Layer4FC2/add_grad/ShapeShapeLayer4FC2/MatMul*
T0*
out_type0*
_output_shapes
:
u
+lossss/gradients/Layer4FC2/add_grad/Shape_1Const*
dtype0*
valueB:T*
_output_shapes
:
у
9lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgsBroadcastGradientArgs)lossss/gradients/Layer4FC2/add_grad/Shape+lossss/gradients/Layer4FC2/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
п
'lossss/gradients/Layer4FC2/add_grad/SumSum-lossss/gradients/Layer4FC2/Relu_grad/ReluGrad9lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╩
+lossss/gradients/Layer4FC2/add_grad/ReshapeReshape'lossss/gradients/Layer4FC2/add_grad/Sum)lossss/gradients/Layer4FC2/add_grad/Shape*
T0*'
_output_shapes
:         T*
Tshape0
▄
)lossss/gradients/Layer4FC2/add_grad/Sum_1Sum-lossss/gradients/Layer4FC2/Relu_grad/ReluGrad;lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
├
-lossss/gradients/Layer4FC2/add_grad/Reshape_1Reshape)lossss/gradients/Layer4FC2/add_grad/Sum_1+lossss/gradients/Layer4FC2/add_grad/Shape_1*
T0*
_output_shapes
:T*
Tshape0
џ
4lossss/gradients/Layer4FC2/add_grad/tuple/group_depsNoOp,^lossss/gradients/Layer4FC2/add_grad/Reshape.^lossss/gradients/Layer4FC2/add_grad/Reshape_1
ъ
<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependencyIdentity+lossss/gradients/Layer4FC2/add_grad/Reshape5^lossss/gradients/Layer4FC2/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         T*>
_class4
20loc:@lossss/gradients/Layer4FC2/add_grad/Reshape
Ќ
>lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency_1Identity-lossss/gradients/Layer4FC2/add_grad/Reshape_15^lossss/gradients/Layer4FC2/add_grad/tuple/group_deps*
T0*
_output_shapes
:T*@
_class6
42loc:@lossss/gradients/Layer4FC2/add_grad/Reshape_1
Т
-lossss/gradients/Layer4FC2/MatMul_grad/MatMulMatMul<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependencyLayer4FC2/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         x
о
/lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1MatMulLayer3FC1/Relu<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:xT
А
7lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_depsNoOp.^lossss/gradients/Layer4FC2/MatMul_grad/MatMul0^lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1
е
?lossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependencyIdentity-lossss/gradients/Layer4FC2/MatMul_grad/MatMul8^lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:         x*@
_class6
42loc:@lossss/gradients/Layer4FC2/MatMul_grad/MatMul
Ц
Alossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependency_1Identity/lossss/gradients/Layer4FC2/MatMul_grad/MatMul_18^lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:xT*B
_class8
64loc:@lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1
╝
-lossss/gradients/Layer3FC1/Relu_grad/ReluGradReluGrad?lossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependencyLayer3FC1/Relu*
T0*'
_output_shapes
:         x
y
)lossss/gradients/Layer3FC1/add_grad/ShapeShapeLayer3FC1/MatMul*
T0*
out_type0*
_output_shapes
:
u
+lossss/gradients/Layer3FC1/add_grad/Shape_1Const*
dtype0*
valueB:x*
_output_shapes
:
у
9lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgsBroadcastGradientArgs)lossss/gradients/Layer3FC1/add_grad/Shape+lossss/gradients/Layer3FC1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
п
'lossss/gradients/Layer3FC1/add_grad/SumSum-lossss/gradients/Layer3FC1/Relu_grad/ReluGrad9lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╩
+lossss/gradients/Layer3FC1/add_grad/ReshapeReshape'lossss/gradients/Layer3FC1/add_grad/Sum)lossss/gradients/Layer3FC1/add_grad/Shape*
T0*'
_output_shapes
:         x*
Tshape0
▄
)lossss/gradients/Layer3FC1/add_grad/Sum_1Sum-lossss/gradients/Layer3FC1/Relu_grad/ReluGrad;lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
├
-lossss/gradients/Layer3FC1/add_grad/Reshape_1Reshape)lossss/gradients/Layer3FC1/add_grad/Sum_1+lossss/gradients/Layer3FC1/add_grad/Shape_1*
T0*
_output_shapes
:x*
Tshape0
џ
4lossss/gradients/Layer3FC1/add_grad/tuple/group_depsNoOp,^lossss/gradients/Layer3FC1/add_grad/Reshape.^lossss/gradients/Layer3FC1/add_grad/Reshape_1
ъ
<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependencyIdentity+lossss/gradients/Layer3FC1/add_grad/Reshape5^lossss/gradients/Layer3FC1/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         x*>
_class4
20loc:@lossss/gradients/Layer3FC1/add_grad/Reshape
Ќ
>lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency_1Identity-lossss/gradients/Layer3FC1/add_grad/Reshape_15^lossss/gradients/Layer3FC1/add_grad/tuple/group_deps*
T0*
_output_shapes
:x*@
_class6
42loc:@lossss/gradients/Layer3FC1/add_grad/Reshape_1
у
-lossss/gradients/Layer3FC1/MatMul_grad/MatMulMatMul<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependencyLayer3FC1/Variable/read*
T0*
transpose_b(*
transpose_a( *(
_output_shapes
:         љ
с
/lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1MatMulLayer2ConV/Flatten/Reshape<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes
:	љx
А
7lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_depsNoOp.^lossss/gradients/Layer3FC1/MatMul_grad/MatMul0^lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1
Е
?lossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependencyIdentity-lossss/gradients/Layer3FC1/MatMul_grad/MatMul8^lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:         љ*@
_class6
42loc:@lossss/gradients/Layer3FC1/MatMul_grad/MatMul
д
Alossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency_1Identity/lossss/gradients/Layer3FC1/MatMul_grad/MatMul_18^lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	љx*B
_class8
64loc:@lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1
ѕ
6lossss/gradients/Layer2ConV/Flatten/Reshape_grad/ShapeShapeLayer2ConV/MaxPool*
T0*
out_type0*
_output_shapes
:
ё
8lossss/gradients/Layer2ConV/Flatten/Reshape_grad/ReshapeReshape?lossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency6lossss/gradients/Layer2ConV/Flatten/Reshape_grad/Shape*
T0*/
_output_shapes
:         *
Tshape0
»
4lossss/gradients/Layer2ConV/MaxPool_grad/MaxPoolGradMaxPoolGradLayer2ConV/ReluLayer2ConV/MaxPool8lossss/gradients/Layer2ConV/Flatten/Reshape_grad/Reshape*
ksize
*
data_formatNHWC*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

╗
.lossss/gradients/Layer2ConV/Relu_grad/ReluGradReluGrad4lossss/gradients/Layer2ConV/MaxPool_grad/MaxPoolGradLayer2ConV/Relu*
T0*/
_output_shapes
:         


{
*lossss/gradients/Layer2ConV/add_grad/ShapeShapeLayer2ConV/Conv2D*
T0*
out_type0*
_output_shapes
:
v
,lossss/gradients/Layer2ConV/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ж
:lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgsBroadcastGradientArgs*lossss/gradients/Layer2ConV/add_grad/Shape,lossss/gradients/Layer2ConV/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
█
(lossss/gradients/Layer2ConV/add_grad/SumSum.lossss/gradients/Layer2ConV/Relu_grad/ReluGrad:lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
Н
,lossss/gradients/Layer2ConV/add_grad/ReshapeReshape(lossss/gradients/Layer2ConV/add_grad/Sum*lossss/gradients/Layer2ConV/add_grad/Shape*
T0*/
_output_shapes
:         

*
Tshape0
▀
*lossss/gradients/Layer2ConV/add_grad/Sum_1Sum.lossss/gradients/Layer2ConV/Relu_grad/ReluGrad<lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
к
.lossss/gradients/Layer2ConV/add_grad/Reshape_1Reshape*lossss/gradients/Layer2ConV/add_grad/Sum_1,lossss/gradients/Layer2ConV/add_grad/Shape_1*
T0*
_output_shapes
:*
Tshape0
Ю
5lossss/gradients/Layer2ConV/add_grad/tuple/group_depsNoOp-^lossss/gradients/Layer2ConV/add_grad/Reshape/^lossss/gradients/Layer2ConV/add_grad/Reshape_1
ф
=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer2ConV/add_grad/Reshape6^lossss/gradients/Layer2ConV/add_grad/tuple/group_deps*
T0*/
_output_shapes
:         

*?
_class5
31loc:@lossss/gradients/Layer2ConV/add_grad/Reshape
Џ
?lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer2ConV/add_grad/Reshape_16^lossss/gradients/Layer2ConV/add_grad/tuple/group_deps*
T0*
_output_shapes
:*A
_class7
53loc:@lossss/gradients/Layer2ConV/add_grad/Reshape_1

-lossss/gradients/Layer2ConV/Conv2D_grad/ShapeShapeLayer1ConV/MaxPool*
T0*
out_type0*
_output_shapes
:
Є
;lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput-lossss/gradients/Layer2ConV/Conv2D_grad/ShapeLayer2ConV/Variable/read=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ѕ
/lossss/gradients/Layer2ConV/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
р
<lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterLayer1ConV/MaxPool/lossss/gradients/Layer2ConV/Conv2D_grad/Shape_1=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

й
8lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_depsNoOp<^lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput=^lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter
╬
@lossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependencyIdentity;lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput9^lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_deps*
T0*/
_output_shapes
:         *N
_classD
B@loc:@lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput
╔
Blossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency_1Identity<lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter9^lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_deps*
T0*&
_output_shapes
:*O
_classE
CAloc:@lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter
и
4lossss/gradients/Layer1ConV/MaxPool_grad/MaxPoolGradMaxPoolGradLayer1ConV/ReluLayer1ConV/MaxPool@lossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

╗
.lossss/gradients/Layer1ConV/Relu_grad/ReluGradReluGrad4lossss/gradients/Layer1ConV/MaxPool_grad/MaxPoolGradLayer1ConV/Relu*
T0*/
_output_shapes
:         
{
*lossss/gradients/Layer1ConV/add_grad/ShapeShapeLayer1ConV/Conv2D*
T0*
out_type0*
_output_shapes
:
v
,lossss/gradients/Layer1ConV/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ж
:lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgsBroadcastGradientArgs*lossss/gradients/Layer1ConV/add_grad/Shape,lossss/gradients/Layer1ConV/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
█
(lossss/gradients/Layer1ConV/add_grad/SumSum.lossss/gradients/Layer1ConV/Relu_grad/ReluGrad:lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
Н
,lossss/gradients/Layer1ConV/add_grad/ReshapeReshape(lossss/gradients/Layer1ConV/add_grad/Sum*lossss/gradients/Layer1ConV/add_grad/Shape*
T0*/
_output_shapes
:         *
Tshape0
▀
*lossss/gradients/Layer1ConV/add_grad/Sum_1Sum.lossss/gradients/Layer1ConV/Relu_grad/ReluGrad<lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
к
.lossss/gradients/Layer1ConV/add_grad/Reshape_1Reshape*lossss/gradients/Layer1ConV/add_grad/Sum_1,lossss/gradients/Layer1ConV/add_grad/Shape_1*
T0*
_output_shapes
:*
Tshape0
Ю
5lossss/gradients/Layer1ConV/add_grad/tuple/group_depsNoOp-^lossss/gradients/Layer1ConV/add_grad/Reshape/^lossss/gradients/Layer1ConV/add_grad/Reshape_1
ф
=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer1ConV/add_grad/Reshape6^lossss/gradients/Layer1ConV/add_grad/tuple/group_deps*
T0*/
_output_shapes
:         *?
_class5
31loc:@lossss/gradients/Layer1ConV/add_grad/Reshape
Џ
?lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer1ConV/add_grad/Reshape_16^lossss/gradients/Layer1ConV/add_grad/tuple/group_deps*
T0*
_output_shapes
:*A
_class7
53loc:@lossss/gradients/Layer1ConV/add_grad/Reshape_1
x
-lossss/gradients/Layer1ConV/Conv2D_grad/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:
Є
;lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput-lossss/gradients/Layer1ConV/Conv2D_grad/ShapeLayer1ConV/Variable/read=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ѕ
/lossss/gradients/Layer1ConV/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
┌
<lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterPlaceholder/lossss/gradients/Layer1ConV/Conv2D_grad/Shape_1=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

й
8lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_depsNoOp<^lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput=^lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter
╬
@lossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependencyIdentity;lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput9^lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_deps*
T0*/
_output_shapes
:           *N
_classD
B@loc:@lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput
╔
Blossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependency_1Identity<lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter9^lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_deps*
T0*&
_output_shapes
:*O
_classE
CAloc:@lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter
Ї
 lossss/beta1_power/initial_valueConst*
dtype0*
valueB
 *fff?*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
ю
lossss/beta1_powerVariable*
dtype0*
shape: *&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *
_output_shapes
: 
╦
lossss/beta1_power/AssignAssignlossss/beta1_power lossss/beta1_power/initial_value*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
ђ
lossss/beta1_power/readIdentitylossss/beta1_power*
T0*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
Ї
 lossss/beta2_power/initial_valueConst*
dtype0*
valueB
 *wЙ?*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
ю
lossss/beta2_powerVariable*
dtype0*
shape: *&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *
_output_shapes
: 
╦
lossss/beta2_power/AssignAssignlossss/beta2_power lossss/beta2_power/initial_value*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
ђ
lossss/beta2_power/readIdentitylossss/beta2_power*
T0*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
q
lossss/zerosConst*
dtype0*%
valueB*    *&
_output_shapes
:
╔
lossss/Layer1ConV/Variable/AdamVariable*
dtype0*
shape:*&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *&
_output_shapes
:
р
&lossss/Layer1ConV/Variable/Adam/AssignAssignlossss/Layer1ConV/Variable/Adamlossss/zeros*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
ф
$lossss/Layer1ConV/Variable/Adam/readIdentitylossss/Layer1ConV/Variable/Adam*
T0*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
s
lossss/zeros_1Const*
dtype0*%
valueB*    *&
_output_shapes
:
╦
!lossss/Layer1ConV/Variable/Adam_1Variable*
dtype0*
shape:*&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *&
_output_shapes
:
у
(lossss/Layer1ConV/Variable/Adam_1/AssignAssign!lossss/Layer1ConV/Variable/Adam_1lossss/zeros_1*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
«
&lossss/Layer1ConV/Variable/Adam_1/readIdentity!lossss/Layer1ConV/Variable/Adam_1*
T0*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
[
lossss/zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
х
!lossss/Layer1ConV/Variable_1/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer1ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
П
(lossss/Layer1ConV/Variable_1/Adam/AssignAssign!lossss/Layer1ConV/Variable_1/Adamlossss/zeros_2*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
ц
&lossss/Layer1ConV/Variable_1/Adam/readIdentity!lossss/Layer1ConV/Variable_1/Adam*
T0*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
[
lossss/zeros_3Const*
dtype0*
valueB*    *
_output_shapes
:
и
#lossss/Layer1ConV/Variable_1/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer1ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
р
*lossss/Layer1ConV/Variable_1/Adam_1/AssignAssign#lossss/Layer1ConV/Variable_1/Adam_1lossss/zeros_3*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
е
(lossss/Layer1ConV/Variable_1/Adam_1/readIdentity#lossss/Layer1ConV/Variable_1/Adam_1*
T0*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
s
lossss/zeros_4Const*
dtype0*%
valueB*    *&
_output_shapes
:
╔
lossss/Layer2ConV/Variable/AdamVariable*
dtype0*
shape:*&
_class
loc:@Layer2ConV/Variable*
shared_name *
	container *&
_output_shapes
:
с
&lossss/Layer2ConV/Variable/Adam/AssignAssignlossss/Layer2ConV/Variable/Adamlossss/zeros_4*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
ф
$lossss/Layer2ConV/Variable/Adam/readIdentitylossss/Layer2ConV/Variable/Adam*
T0*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
s
lossss/zeros_5Const*
dtype0*%
valueB*    *&
_output_shapes
:
╦
!lossss/Layer2ConV/Variable/Adam_1Variable*
dtype0*
shape:*&
_class
loc:@Layer2ConV/Variable*
shared_name *
	container *&
_output_shapes
:
у
(lossss/Layer2ConV/Variable/Adam_1/AssignAssign!lossss/Layer2ConV/Variable/Adam_1lossss/zeros_5*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
«
&lossss/Layer2ConV/Variable/Adam_1/readIdentity!lossss/Layer2ConV/Variable/Adam_1*
T0*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
[
lossss/zeros_6Const*
dtype0*
valueB*    *
_output_shapes
:
х
!lossss/Layer2ConV/Variable_1/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer2ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
П
(lossss/Layer2ConV/Variable_1/Adam/AssignAssign!lossss/Layer2ConV/Variable_1/Adamlossss/zeros_6*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
ц
&lossss/Layer2ConV/Variable_1/Adam/readIdentity!lossss/Layer2ConV/Variable_1/Adam*
T0*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
[
lossss/zeros_7Const*
dtype0*
valueB*    *
_output_shapes
:
и
#lossss/Layer2ConV/Variable_1/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer2ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
р
*lossss/Layer2ConV/Variable_1/Adam_1/AssignAssign#lossss/Layer2ConV/Variable_1/Adam_1lossss/zeros_7*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
е
(lossss/Layer2ConV/Variable_1/Adam_1/readIdentity#lossss/Layer2ConV/Variable_1/Adam_1*
T0*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
e
lossss/zeros_8Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
╣
lossss/Layer3FC1/Variable/AdamVariable*
dtype0*
shape:	љx*%
_class
loc:@Layer3FC1/Variable*
shared_name *
	container *
_output_shapes
:	љx
┘
%lossss/Layer3FC1/Variable/Adam/AssignAssignlossss/Layer3FC1/Variable/Adamlossss/zeros_8*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
а
#lossss/Layer3FC1/Variable/Adam/readIdentitylossss/Layer3FC1/Variable/Adam*
T0*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
e
lossss/zeros_9Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
╗
 lossss/Layer3FC1/Variable/Adam_1Variable*
dtype0*
shape:	љx*%
_class
loc:@Layer3FC1/Variable*
shared_name *
	container *
_output_shapes
:	љx
П
'lossss/Layer3FC1/Variable/Adam_1/AssignAssign lossss/Layer3FC1/Variable/Adam_1lossss/zeros_9*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
ц
%lossss/Layer3FC1/Variable/Adam_1/readIdentity lossss/Layer3FC1/Variable/Adam_1*
T0*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
\
lossss/zeros_10Const*
dtype0*
valueBx*    *
_output_shapes
:x
│
 lossss/Layer3FC1/Variable_1/AdamVariable*
dtype0*
shape:x*'
_class
loc:@Layer3FC1/Variable_1*
shared_name *
	container *
_output_shapes
:x
█
'lossss/Layer3FC1/Variable_1/Adam/AssignAssign lossss/Layer3FC1/Variable_1/Adamlossss/zeros_10*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
А
%lossss/Layer3FC1/Variable_1/Adam/readIdentity lossss/Layer3FC1/Variable_1/Adam*
T0*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
\
lossss/zeros_11Const*
dtype0*
valueBx*    *
_output_shapes
:x
х
"lossss/Layer3FC1/Variable_1/Adam_1Variable*
dtype0*
shape:x*'
_class
loc:@Layer3FC1/Variable_1*
shared_name *
	container *
_output_shapes
:x
▀
)lossss/Layer3FC1/Variable_1/Adam_1/AssignAssign"lossss/Layer3FC1/Variable_1/Adam_1lossss/zeros_11*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Ц
'lossss/Layer3FC1/Variable_1/Adam_1/readIdentity"lossss/Layer3FC1/Variable_1/Adam_1*
T0*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
d
lossss/zeros_12Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
и
lossss/Layer4FC2/Variable/AdamVariable*
dtype0*
shape
:xT*%
_class
loc:@Layer4FC2/Variable*
shared_name *
	container *
_output_shapes

:xT
┘
%lossss/Layer4FC2/Variable/Adam/AssignAssignlossss/Layer4FC2/Variable/Adamlossss/zeros_12*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Ъ
#lossss/Layer4FC2/Variable/Adam/readIdentitylossss/Layer4FC2/Variable/Adam*
T0*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
d
lossss/zeros_13Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
╣
 lossss/Layer4FC2/Variable/Adam_1Variable*
dtype0*
shape
:xT*%
_class
loc:@Layer4FC2/Variable*
shared_name *
	container *
_output_shapes

:xT
П
'lossss/Layer4FC2/Variable/Adam_1/AssignAssign lossss/Layer4FC2/Variable/Adam_1lossss/zeros_13*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Б
%lossss/Layer4FC2/Variable/Adam_1/readIdentity lossss/Layer4FC2/Variable/Adam_1*
T0*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
\
lossss/zeros_14Const*
dtype0*
valueBT*    *
_output_shapes
:T
│
 lossss/Layer4FC2/Variable_1/AdamVariable*
dtype0*
shape:T*'
_class
loc:@Layer4FC2/Variable_1*
shared_name *
	container *
_output_shapes
:T
█
'lossss/Layer4FC2/Variable_1/Adam/AssignAssign lossss/Layer4FC2/Variable_1/Adamlossss/zeros_14*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
А
%lossss/Layer4FC2/Variable_1/Adam/readIdentity lossss/Layer4FC2/Variable_1/Adam*
T0*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
\
lossss/zeros_15Const*
dtype0*
valueBT*    *
_output_shapes
:T
х
"lossss/Layer4FC2/Variable_1/Adam_1Variable*
dtype0*
shape:T*'
_class
loc:@Layer4FC2/Variable_1*
shared_name *
	container *
_output_shapes
:T
▀
)lossss/Layer4FC2/Variable_1/Adam_1/AssignAssign"lossss/Layer4FC2/Variable_1/Adam_1lossss/zeros_15*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
Ц
'lossss/Layer4FC2/Variable_1/Adam_1/readIdentity"lossss/Layer4FC2/Variable_1/Adam_1*
T0*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
d
lossss/zeros_16Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
х
lossss/Layer5FC/Variable/AdamVariable*
dtype0*
shape
:T+*$
_class
loc:@Layer5FC/Variable*
shared_name *
	container *
_output_shapes

:T+
о
$lossss/Layer5FC/Variable/Adam/AssignAssignlossss/Layer5FC/Variable/Adamlossss/zeros_16*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
ю
"lossss/Layer5FC/Variable/Adam/readIdentitylossss/Layer5FC/Variable/Adam*
T0*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
d
lossss/zeros_17Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
и
lossss/Layer5FC/Variable/Adam_1Variable*
dtype0*
shape
:T+*$
_class
loc:@Layer5FC/Variable*
shared_name *
	container *
_output_shapes

:T+
┌
&lossss/Layer5FC/Variable/Adam_1/AssignAssignlossss/Layer5FC/Variable/Adam_1lossss/zeros_17*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
а
$lossss/Layer5FC/Variable/Adam_1/readIdentitylossss/Layer5FC/Variable/Adam_1*
T0*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
\
lossss/zeros_18Const*
dtype0*
valueB+*    *
_output_shapes
:+
▒
lossss/Layer5FC/Variable_1/AdamVariable*
dtype0*
shape:+*&
_class
loc:@Layer5FC/Variable_1*
shared_name *
	container *
_output_shapes
:+
п
&lossss/Layer5FC/Variable_1/Adam/AssignAssignlossss/Layer5FC/Variable_1/Adamlossss/zeros_18*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
ъ
$lossss/Layer5FC/Variable_1/Adam/readIdentitylossss/Layer5FC/Variable_1/Adam*
T0*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
\
lossss/zeros_19Const*
dtype0*
valueB+*    *
_output_shapes
:+
│
!lossss/Layer5FC/Variable_1/Adam_1Variable*
dtype0*
shape:+*&
_class
loc:@Layer5FC/Variable_1*
shared_name *
	container *
_output_shapes
:+
▄
(lossss/Layer5FC/Variable_1/Adam_1/AssignAssign!lossss/Layer5FC/Variable_1/Adam_1lossss/zeros_19*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
б
&lossss/Layer5FC/Variable_1/Adam_1/readIdentity!lossss/Layer5FC/Variable_1/Adam_1*
T0*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
^
lossss/Adam/learning_rateConst*
dtype0*
valueB
 *oЃ:*
_output_shapes
: 
V
lossss/Adam/beta1Const*
dtype0*
valueB
 *fff?*
_output_shapes
: 
V
lossss/Adam/beta2Const*
dtype0*
valueB
 *wЙ?*
_output_shapes
: 
X
lossss/Adam/epsilonConst*
dtype0*
valueB
 *w╠+2*
_output_shapes
: 
╬
0lossss/Adam/update_Layer1ConV/Variable/ApplyAdam	ApplyAdamLayer1ConV/Variablelossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonBlossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
╔
2lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam	ApplyAdamLayer1ConV/Variable_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon?lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
╬
0lossss/Adam/update_Layer2ConV/Variable/ApplyAdam	ApplyAdamLayer2ConV/Variablelossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonBlossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
╔
2lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam	ApplyAdamLayer2ConV/Variable_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon?lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
┴
/lossss/Adam/update_Layer3FC1/Variable/ApplyAdam	ApplyAdamLayer3FC1/Variablelossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonAlossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
├
1lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam	ApplyAdamLayer3FC1/Variable_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon>lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
└
/lossss/Adam/update_Layer4FC2/Variable/ApplyAdam	ApplyAdamLayer4FC2/Variablelossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonAlossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
├
1lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam	ApplyAdamLayer4FC2/Variable_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon>lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
║
.lossss/Adam/update_Layer5FC/Variable/ApplyAdam	ApplyAdamLayer5FC/Variablelossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon@lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
й
0lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam	ApplyAdamLayer5FC/Variable_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon=lossss/gradients/Layer5FC/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
І
lossss/Adam/mulMullossss/beta1_power/readlossss/Adam/beta11^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam*
T0*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
│
lossss/Adam/AssignAssignlossss/beta1_powerlossss/Adam/mul*
use_locking( *
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
Ї
lossss/Adam/mul_1Mullossss/beta2_power/readlossss/Adam/beta21^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam*
T0*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
и
lossss/Adam/Assign_1Assignlossss/beta2_powerlossss/Adam/mul_1*
use_locking( *
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
┐
lossss/AdamNoOp1^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam^lossss/Adam/Assign^lossss/Adam/Assign_1
[
accuracy/ArgMax/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
|
accuracy/ArgMaxArgMaxLayer5FC/addaccuracy/ArgMax/dimension*
T0*

Tidx0*#
_output_shapes
:         
]
accuracy/ArgMax_1/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
p
accuracy/ArgMax_1ArgMaxone_hotaccuracy/ArgMax_1/dimension*
T0*

Tidx0*
_output_shapes
:
^
accuracy/EqualEqualaccuracy/ArgMaxaccuracy/ArgMax_1*
T0	*
_output_shapes
:
W
accuracy/CastCastaccuracy/Equal*

DstT0*

SrcT0
*
_output_shapes
:
E
accuracy/RankRankaccuracy/Cast*
T0*
_output_shapes
: 
V
accuracy/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
V
accuracy/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ѓ
accuracy/rangeRangeaccuracy/range/startaccuracy/Rankaccuracy/range/delta*

Tidx0*#
_output_shapes
:         
t
accuracy/MeanMeanaccuracy/Castaccuracy/range*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
d
accuracy/ScalarSummary/tagsConst*
dtype0*
valueB Baccuracy*
_output_shapes
: 
t
accuracy/ScalarSummaryScalarSummaryaccuracy/ScalarSummary/tagsaccuracy/Mean*
T0*
_output_shapes
: 
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
і
save/SaveV2/tensor_namesConst*
dtype0*й
value│B░ BLayer1ConV/VariableBLayer1ConV/Variable_1BLayer2ConV/VariableBLayer2ConV/Variable_1BLayer3FC1/VariableBLayer3FC1/Variable_1BLayer4FC2/VariableBLayer4FC2/Variable_1BLayer5FC/VariableBLayer5FC/Variable_1Blossss/Layer1ConV/Variable/AdamB!lossss/Layer1ConV/Variable/Adam_1B!lossss/Layer1ConV/Variable_1/AdamB#lossss/Layer1ConV/Variable_1/Adam_1Blossss/Layer2ConV/Variable/AdamB!lossss/Layer2ConV/Variable/Adam_1B!lossss/Layer2ConV/Variable_1/AdamB#lossss/Layer2ConV/Variable_1/Adam_1Blossss/Layer3FC1/Variable/AdamB lossss/Layer3FC1/Variable/Adam_1B lossss/Layer3FC1/Variable_1/AdamB"lossss/Layer3FC1/Variable_1/Adam_1Blossss/Layer4FC2/Variable/AdamB lossss/Layer4FC2/Variable/Adam_1B lossss/Layer4FC2/Variable_1/AdamB"lossss/Layer4FC2/Variable_1/Adam_1Blossss/Layer5FC/Variable/AdamBlossss/Layer5FC/Variable/Adam_1Blossss/Layer5FC/Variable_1/AdamB!lossss/Layer5FC/Variable_1/Adam_1Blossss/beta1_powerBlossss/beta2_power*
_output_shapes
: 
Б
save/SaveV2/shape_and_slicesConst*
dtype0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
: 
▒
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesLayer1ConV/VariableLayer1ConV/Variable_1Layer2ConV/VariableLayer2ConV/Variable_1Layer3FC1/VariableLayer3FC1/Variable_1Layer4FC2/VariableLayer4FC2/Variable_1Layer5FC/VariableLayer5FC/Variable_1lossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_powerlossss/beta2_power*.
dtypes$
"2 
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_output_shapes
: *
_class
loc:@save/Const
w
save/RestoreV2/tensor_namesConst*
dtype0*(
valueBBLayer1ConV/Variable*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
љ
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save/AssignAssignLayer1ConV/Variablesave/RestoreV2*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
{
save/RestoreV2_1/tensor_namesConst*
dtype0**
value!BBLayer1ConV/Variable_1*
_output_shapes
:
j
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
И
save/Assign_1AssignLayer1ConV/Variable_1save/RestoreV2_1*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
y
save/RestoreV2_2/tensor_namesConst*
dtype0*(
valueBBLayer2ConV/Variable*
_output_shapes
:
j
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save/Assign_2AssignLayer2ConV/Variablesave/RestoreV2_2*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
{
save/RestoreV2_3/tensor_namesConst*
dtype0**
value!BBLayer2ConV/Variable_1*
_output_shapes
:
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
И
save/Assign_3AssignLayer2ConV/Variable_1save/RestoreV2_3*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
x
save/RestoreV2_4/tensor_namesConst*
dtype0*'
valueBBLayer3FC1/Variable*
_output_shapes
:
j
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
и
save/Assign_4AssignLayer3FC1/Variablesave/RestoreV2_4*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
z
save/RestoreV2_5/tensor_namesConst*
dtype0*)
value BBLayer3FC1/Variable_1*
_output_shapes
:
j
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_5AssignLayer3FC1/Variable_1save/RestoreV2_5*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
x
save/RestoreV2_6/tensor_namesConst*
dtype0*'
valueBBLayer4FC2/Variable*
_output_shapes
:
j
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_6AssignLayer4FC2/Variablesave/RestoreV2_6*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
z
save/RestoreV2_7/tensor_namesConst*
dtype0*)
value BBLayer4FC2/Variable_1*
_output_shapes
:
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_7AssignLayer4FC2/Variable_1save/RestoreV2_7*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
w
save/RestoreV2_8/tensor_namesConst*
dtype0*&
valueBBLayer5FC/Variable*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
┤
save/Assign_8AssignLayer5FC/Variablesave/RestoreV2_8*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
y
save/RestoreV2_9/tensor_namesConst*
dtype0*(
valueBBLayer5FC/Variable_1*
_output_shapes
:
j
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
┤
save/Assign_9AssignLayer5FC/Variable_1save/RestoreV2_9*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
є
save/RestoreV2_10/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer1ConV/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save/Assign_10Assignlossss/Layer1ConV/Variable/Adamsave/RestoreV2_10*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
ѕ
save/RestoreV2_11/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_11Assign!lossss/Layer1ConV/Variable/Adam_1save/RestoreV2_11*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
ѕ
save/RestoreV2_12/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_12Assign!lossss/Layer1ConV/Variable_1/Adamsave/RestoreV2_12*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
і
save/RestoreV2_13/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer1ConV/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_13Assign#lossss/Layer1ConV/Variable_1/Adam_1save/RestoreV2_13*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
є
save/RestoreV2_14/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer2ConV/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save/Assign_14Assignlossss/Layer2ConV/Variable/Adamsave/RestoreV2_14*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
ѕ
save/RestoreV2_15/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_15Assign!lossss/Layer2ConV/Variable/Adam_1save/RestoreV2_15*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
ѕ
save/RestoreV2_16/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_16Assign!lossss/Layer2ConV/Variable_1/Adamsave/RestoreV2_16*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
і
save/RestoreV2_17/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer2ConV/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_17Assign#lossss/Layer2ConV/Variable_1/Adam_1save/RestoreV2_17*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
Ё
save/RestoreV2_18/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer3FC1/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_18/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
┼
save/Assign_18Assignlossss/Layer3FC1/Variable/Adamsave/RestoreV2_18*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
Є
save/RestoreV2_19/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_19/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
К
save/Assign_19Assign lossss/Layer3FC1/Variable/Adam_1save/RestoreV2_19*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
Є
save/RestoreV2_20/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_20/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_20Assign lossss/Layer3FC1/Variable_1/Adamsave/RestoreV2_20*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Ѕ
save/RestoreV2_21/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer3FC1/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_21/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_21Assign"lossss/Layer3FC1/Variable_1/Adam_1save/RestoreV2_21*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Ё
save/RestoreV2_22/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer4FC2/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_22/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_22Assignlossss/Layer4FC2/Variable/Adamsave/RestoreV2_22*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Є
save/RestoreV2_23/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_23/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_23Assign lossss/Layer4FC2/Variable/Adam_1save/RestoreV2_23*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Є
save/RestoreV2_24/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_24/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_24Assign lossss/Layer4FC2/Variable_1/Adamsave/RestoreV2_24*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
Ѕ
save/RestoreV2_25/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer4FC2/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_25/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_25	RestoreV2
save/Constsave/RestoreV2_25/tensor_names"save/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_25Assign"lossss/Layer4FC2/Variable_1/Adam_1save/RestoreV2_25*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
ё
save/RestoreV2_26/tensor_namesConst*
dtype0*2
value)B'Blossss/Layer5FC/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_26/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_26	RestoreV2
save/Constsave/RestoreV2_26/tensor_names"save/RestoreV2_26/shape_and_slices*
dtypes
2*
_output_shapes
:
┬
save/Assign_26Assignlossss/Layer5FC/Variable/Adamsave/RestoreV2_26*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
є
save/RestoreV2_27/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_27/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_27	RestoreV2
save/Constsave/RestoreV2_27/tensor_names"save/RestoreV2_27/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_27Assignlossss/Layer5FC/Variable/Adam_1save/RestoreV2_27*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
є
save/RestoreV2_28/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_28/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_28	RestoreV2
save/Constsave/RestoreV2_28/tensor_names"save/RestoreV2_28/shape_and_slices*
dtypes
2*
_output_shapes
:
┬
save/Assign_28Assignlossss/Layer5FC/Variable_1/Adamsave/RestoreV2_28*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
ѕ
save/RestoreV2_29/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer5FC/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_29/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_29	RestoreV2
save/Constsave/RestoreV2_29/tensor_names"save/RestoreV2_29/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_29Assign!lossss/Layer5FC/Variable_1/Adam_1save/RestoreV2_29*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
y
save/RestoreV2_30/tensor_namesConst*
dtype0*'
valueBBlossss/beta1_power*
_output_shapes
:
k
"save/RestoreV2_30/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_30	RestoreV2
save/Constsave/RestoreV2_30/tensor_names"save/RestoreV2_30/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_30Assignlossss/beta1_powersave/RestoreV2_30*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
y
save/RestoreV2_31/tensor_namesConst*
dtype0*'
valueBBlossss/beta2_power*
_output_shapes
:
k
"save/RestoreV2_31/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_31	RestoreV2
save/Constsave/RestoreV2_31/tensor_names"save/RestoreV2_31/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_31Assignlossss/beta2_powersave/RestoreV2_31*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
г
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_30^save/Assign_31
╬
Merge/MergeSummaryMergeSummaryLayer1ConV/conv1_w_smryLayer2ConV/conv2_w_smryLayer3FC1/fc1_W_smryLayer4FC2/fc2_W_smryLayer5FC/fc3_W_smryaccuracy/ScalarSummary*
N*
_output_shapes
: 
┤	
initNoOp^Layer1ConV/Variable/Assign^Layer1ConV/Variable_1/Assign^Layer2ConV/Variable/Assign^Layer2ConV/Variable_1/Assign^Layer3FC1/Variable/Assign^Layer3FC1/Variable_1/Assign^Layer4FC2/Variable/Assign^Layer4FC2/Variable_1/Assign^Layer5FC/Variable/Assign^Layer5FC/Variable_1/Assign^lossss/beta1_power/Assign^lossss/beta2_power/Assign'^lossss/Layer1ConV/Variable/Adam/Assign)^lossss/Layer1ConV/Variable/Adam_1/Assign)^lossss/Layer1ConV/Variable_1/Adam/Assign+^lossss/Layer1ConV/Variable_1/Adam_1/Assign'^lossss/Layer2ConV/Variable/Adam/Assign)^lossss/Layer2ConV/Variable/Adam_1/Assign)^lossss/Layer2ConV/Variable_1/Adam/Assign+^lossss/Layer2ConV/Variable_1/Adam_1/Assign&^lossss/Layer3FC1/Variable/Adam/Assign(^lossss/Layer3FC1/Variable/Adam_1/Assign(^lossss/Layer3FC1/Variable_1/Adam/Assign*^lossss/Layer3FC1/Variable_1/Adam_1/Assign&^lossss/Layer4FC2/Variable/Adam/Assign(^lossss/Layer4FC2/Variable/Adam_1/Assign(^lossss/Layer4FC2/Variable_1/Adam/Assign*^lossss/Layer4FC2/Variable_1/Adam_1/Assign%^lossss/Layer5FC/Variable/Adam/Assign'^lossss/Layer5FC/Variable/Adam_1/Assign'^lossss/Layer5FC/Variable_1/Adam/Assign)^lossss/Layer5FC/Variable_1/Adam_1/Assign
|
#Layer1ConV_1/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
g
"Layer1ConV_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
i
$Layer1ConV_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
╝
-Layer1ConV_1/truncated_normal/TruncatedNormalTruncatedNormal#Layer1ConV_1/truncated_normal/shape*
seed2 *

seed *
dtype0*&
_output_shapes
:*
T0
«
!Layer1ConV_1/truncated_normal/mulMul-Layer1ConV_1/truncated_normal/TruncatedNormal$Layer1ConV_1/truncated_normal/stddev*
T0*&
_output_shapes
:
ю
Layer1ConV_1/truncated_normalAdd!Layer1ConV_1/truncated_normal/mul"Layer1ConV_1/truncated_normal/mean*
T0*&
_output_shapes
:
Ќ
Layer1ConV_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
Я
Layer1ConV_1/Variable/AssignAssignLayer1ConV_1/VariableLayer1ConV_1/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
ў
Layer1ConV_1/Variable/readIdentityLayer1ConV_1/Variable*
T0*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
w
Layer1ConV_1/conv1_w_smry/tagConst*
dtype0**
value!B BLayer1ConV_1/conv1_w_smry*
_output_shapes
: 
Ѕ
Layer1ConV_1/conv1_w_smryHistogramSummaryLayer1ConV_1/conv1_w_smry/tagLayer1ConV_1/Variable/read*
T0*
_output_shapes
: 
_
Layer1ConV_1/zerosConst*
dtype0*
valueB*    *
_output_shapes
:
Ђ
Layer1ConV_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
¤
Layer1ConV_1/Variable_1/AssignAssignLayer1ConV_1/Variable_1Layer1ConV_1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
њ
Layer1ConV_1/Variable_1/readIdentityLayer1ConV_1/Variable_1*
T0*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
п
Layer1ConV_1/Conv2DConv2DPlaceholderLayer1ConV_1/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         *
T0*
paddingVALID*
strides

ё
Layer1ConV_1/addAddLayer1ConV_1/Conv2DLayer1ConV_1/Variable_1/read*
T0*/
_output_shapes
:         
e
Layer1ConV_1/ReluReluLayer1ConV_1/add*
T0*/
_output_shapes
:         
┐
Layer1ConV_1/MaxPoolMaxPoolLayer1ConV_1/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

|
#Layer2ConV_1/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
g
"Layer2ConV_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
i
$Layer2ConV_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
╝
-Layer2ConV_1/truncated_normal/TruncatedNormalTruncatedNormal#Layer2ConV_1/truncated_normal/shape*
seed2 *

seed *
dtype0*&
_output_shapes
:*
T0
«
!Layer2ConV_1/truncated_normal/mulMul-Layer2ConV_1/truncated_normal/TruncatedNormal$Layer2ConV_1/truncated_normal/stddev*
T0*&
_output_shapes
:
ю
Layer2ConV_1/truncated_normalAdd!Layer2ConV_1/truncated_normal/mul"Layer2ConV_1/truncated_normal/mean*
T0*&
_output_shapes
:
Ќ
Layer2ConV_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
Я
Layer2ConV_1/Variable/AssignAssignLayer2ConV_1/VariableLayer2ConV_1/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
ў
Layer2ConV_1/Variable/readIdentityLayer2ConV_1/Variable*
T0*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
w
Layer2ConV_1/conv2_w_smry/tagConst*
dtype0**
value!B BLayer2ConV_1/conv2_w_smry*
_output_shapes
: 
Ѕ
Layer2ConV_1/conv2_w_smryHistogramSummaryLayer2ConV_1/conv2_w_smry/tagLayer2ConV_1/Variable/read*
T0*
_output_shapes
: 
_
Layer2ConV_1/zerosConst*
dtype0*
valueB*    *
_output_shapes
:
Ђ
Layer2ConV_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
¤
Layer2ConV_1/Variable_1/AssignAssignLayer2ConV_1/Variable_1Layer2ConV_1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
њ
Layer2ConV_1/Variable_1/readIdentityLayer2ConV_1/Variable_1*
T0*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
р
Layer2ConV_1/Conv2DConv2DLayer1ConV_1/MaxPoolLayer2ConV_1/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

ё
Layer2ConV_1/addAddLayer2ConV_1/Conv2DLayer2ConV_1/Variable_1/read*
T0*/
_output_shapes
:         


e
Layer2ConV_1/ReluReluLayer2ConV_1/add*
T0*/
_output_shapes
:         


┐
Layer2ConV_1/MaxPoolMaxPoolLayer2ConV_1/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

s
"Layer2ConV_1/Flatten/Reshape/shapeConst*
dtype0*
valueB"    љ  *
_output_shapes
:
б
Layer2ConV_1/Flatten/ReshapeReshapeLayer2ConV_1/MaxPool"Layer2ConV_1/Flatten/Reshape/shape*
T0*(
_output_shapes
:         љ*
Tshape0
s
"Layer3FC1_1/truncated_normal/shapeConst*
dtype0*
valueB"љ  x   *
_output_shapes
:
f
!Layer3FC1_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
h
#Layer3FC1_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
│
,Layer3FC1_1/truncated_normal/TruncatedNormalTruncatedNormal"Layer3FC1_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes
:	љx*
T0
ц
 Layer3FC1_1/truncated_normal/mulMul,Layer3FC1_1/truncated_normal/TruncatedNormal#Layer3FC1_1/truncated_normal/stddev*
T0*
_output_shapes
:	љx
њ
Layer3FC1_1/truncated_normalAdd Layer3FC1_1/truncated_normal/mul!Layer3FC1_1/truncated_normal/mean*
T0*
_output_shapes
:	љx
ѕ
Layer3FC1_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:	љx*
_output_shapes
:	љx
Н
Layer3FC1_1/Variable/AssignAssignLayer3FC1_1/VariableLayer3FC1_1/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
ј
Layer3FC1_1/Variable/readIdentityLayer3FC1_1/Variable*
T0*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
q
Layer3FC1_1/fc1_W_smry/tagConst*
dtype0*'
valueB BLayer3FC1_1/fc1_W_smry*
_output_shapes
: 
ѓ
Layer3FC1_1/fc1_W_smryHistogramSummaryLayer3FC1_1/fc1_W_smry/tagLayer3FC1_1/Variable/read*
T0*
_output_shapes
: 
^
Layer3FC1_1/zerosConst*
dtype0*
valueBx*    *
_output_shapes
:x
ђ
Layer3FC1_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:x*
_output_shapes
:x
╦
Layer3FC1_1/Variable_1/AssignAssignLayer3FC1_1/Variable_1Layer3FC1_1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
Ј
Layer3FC1_1/Variable_1/readIdentityLayer3FC1_1/Variable_1*
T0*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
Г
Layer3FC1_1/MatMulMatMulLayer2ConV_1/Flatten/ReshapeLayer3FC1_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         x
y
Layer3FC1_1/addAddLayer3FC1_1/MatMulLayer3FC1_1/Variable_1/read*
T0*'
_output_shapes
:         x
[
Layer3FC1_1/ReluReluLayer3FC1_1/add*
T0*'
_output_shapes
:         x
s
"Layer4FC2_1/truncated_normal/shapeConst*
dtype0*
valueB"x   T   *
_output_shapes
:
f
!Layer4FC2_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
h
#Layer4FC2_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
▓
,Layer4FC2_1/truncated_normal/TruncatedNormalTruncatedNormal"Layer4FC2_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes

:xT*
T0
Б
 Layer4FC2_1/truncated_normal/mulMul,Layer4FC2_1/truncated_normal/TruncatedNormal#Layer4FC2_1/truncated_normal/stddev*
T0*
_output_shapes

:xT
Љ
Layer4FC2_1/truncated_normalAdd Layer4FC2_1/truncated_normal/mul!Layer4FC2_1/truncated_normal/mean*
T0*
_output_shapes

:xT
є
Layer4FC2_1/VariableVariable*
dtype0*
	container *
shared_name *
shape
:xT*
_output_shapes

:xT
н
Layer4FC2_1/Variable/AssignAssignLayer4FC2_1/VariableLayer4FC2_1/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
Ї
Layer4FC2_1/Variable/readIdentityLayer4FC2_1/Variable*
T0*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
q
Layer4FC2_1/fc2_W_smry/tagConst*
dtype0*'
valueB BLayer4FC2_1/fc2_W_smry*
_output_shapes
: 
ѓ
Layer4FC2_1/fc2_W_smryHistogramSummaryLayer4FC2_1/fc2_W_smry/tagLayer4FC2_1/Variable/read*
T0*
_output_shapes
: 
^
Layer4FC2_1/zerosConst*
dtype0*
valueBT*    *
_output_shapes
:T
ђ
Layer4FC2_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:T*
_output_shapes
:T
╦
Layer4FC2_1/Variable_1/AssignAssignLayer4FC2_1/Variable_1Layer4FC2_1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
Ј
Layer4FC2_1/Variable_1/readIdentityLayer4FC2_1/Variable_1*
T0*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
А
Layer4FC2_1/MatMulMatMulLayer3FC1_1/ReluLayer4FC2_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         T
y
Layer4FC2_1/addAddLayer4FC2_1/MatMulLayer4FC2_1/Variable_1/read*
T0*'
_output_shapes
:         T
[
Layer4FC2_1/ReluReluLayer4FC2_1/add*
T0*'
_output_shapes
:         T
r
!Layer5FC_1/truncated_normal/shapeConst*
dtype0*
valueB"T   +   *
_output_shapes
:
e
 Layer5FC_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer5FC_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
░
+Layer5FC_1/truncated_normal/TruncatedNormalTruncatedNormal!Layer5FC_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
_output_shapes

:T+*
T0
а
Layer5FC_1/truncated_normal/mulMul+Layer5FC_1/truncated_normal/TruncatedNormal"Layer5FC_1/truncated_normal/stddev*
T0*
_output_shapes

:T+
ј
Layer5FC_1/truncated_normalAddLayer5FC_1/truncated_normal/mul Layer5FC_1/truncated_normal/mean*
T0*
_output_shapes

:T+
Ё
Layer5FC_1/VariableVariable*
dtype0*
	container *
shared_name *
shape
:T+*
_output_shapes

:T+
л
Layer5FC_1/Variable/AssignAssignLayer5FC_1/VariableLayer5FC_1/truncated_normal*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
і
Layer5FC_1/Variable/readIdentityLayer5FC_1/Variable*
T0*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
o
Layer5FC_1/fc3_W_smry/tagConst*
dtype0*&
valueB BLayer5FC_1/fc3_W_smry*
_output_shapes
: 

Layer5FC_1/fc3_W_smryHistogramSummaryLayer5FC_1/fc3_W_smry/tagLayer5FC_1/Variable/read*
T0*
_output_shapes
: 
]
Layer5FC_1/zerosConst*
dtype0*
valueB+*    *
_output_shapes
:+

Layer5FC_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:+*
_output_shapes
:+
К
Layer5FC_1/Variable_1/AssignAssignLayer5FC_1/Variable_1Layer5FC_1/zeros*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
ї
Layer5FC_1/Variable_1/readIdentityLayer5FC_1/Variable_1*
T0*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
Ъ
Layer5FC_1/MatMulMatMulLayer4FC2_1/ReluLayer5FC_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         +
v
Layer5FC_1/addAddLayer5FC_1/MatMulLayer5FC_1/Variable_1/read*
T0*'
_output_shapes
:         +
O
lossss_1/RankConst*
dtype0*
value	B :*
_output_shapes
: 
\
lossss_1/ShapeShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
Q
lossss_1/Rank_1Const*
dtype0*
value	B :*
_output_shapes
: 
^
lossss_1/Shape_1ShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
P
lossss_1/Sub/yConst*
dtype0*
value	B :*
_output_shapes
: 
U
lossss_1/SubSublossss_1/Rank_1lossss_1/Sub/y*
T0*
_output_shapes
: 
d
lossss_1/Slice/beginPacklossss_1/Sub*
N*
T0*
_output_shapes
:*

axis 
]
lossss_1/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
є
lossss_1/SliceSlicelossss_1/Shape_1lossss_1/Slice/beginlossss_1/Slice/size*
Index0*
T0*
_output_shapes
:
\
lossss_1/concat/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
k
lossss_1/concat/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ї
lossss_1/concatConcatlossss_1/concat/concat_dimlossss_1/concat/values_0lossss_1/Slice*
N*
T0*
_output_shapes
:
Ё
lossss_1/ReshapeReshapeLayer5FC_1/addlossss_1/concat*
T0*0
_output_shapes
:                  *
Tshape0
A
lossss_1/Rank_2Rankone_hot*
T0*
_output_shapes
: 
`
lossss_1/Shape_2Shapeone_hot*
T0*
out_type0*#
_output_shapes
:         
R
lossss_1/Sub_1/yConst*
dtype0*
value	B :*
_output_shapes
: 
Y
lossss_1/Sub_1Sublossss_1/Rank_2lossss_1/Sub_1/y*
T0*
_output_shapes
: 
h
lossss_1/Slice_1/beginPacklossss_1/Sub_1*
N*
T0*
_output_shapes
:*

axis 
_
lossss_1/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ї
lossss_1/Slice_1Slicelossss_1/Shape_2lossss_1/Slice_1/beginlossss_1/Slice_1/size*
Index0*
T0*
_output_shapes
:
^
lossss_1/concat_1/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
m
lossss_1/concat_1/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ћ
lossss_1/concat_1Concatlossss_1/concat_1/concat_dimlossss_1/concat_1/values_0lossss_1/Slice_1*
N*
T0*
_output_shapes
:
ѓ
lossss_1/Reshape_1Reshapeone_hotlossss_1/concat_1*
T0*0
_output_shapes
:                  *
Tshape0
и
&lossss_1/SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogitslossss_1/Reshapelossss_1/Reshape_1*
T0*?
_output_shapes-
+:         :                  
R
lossss_1/Sub_2/yConst*
dtype0*
value	B :*
_output_shapes
: 
W
lossss_1/Sub_2Sublossss_1/Ranklossss_1/Sub_2/y*
T0*
_output_shapes
: 
`
lossss_1/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
g
lossss_1/Slice_2/sizePacklossss_1/Sub_2*
N*
T0*
_output_shapes
:*

axis 
Њ
lossss_1/Slice_2Slicelossss_1/Shapelossss_1/Slice_2/beginlossss_1/Slice_2/size*
Index0*
T0*#
_output_shapes
:         
Њ
lossss_1/Reshape_2Reshape&lossss_1/SoftmaxCrossEntropyWithLogitslossss_1/Slice_2*
T0*#
_output_shapes
:         *
Tshape0
X
lossss_1/ConstConst*
dtype0*
valueB: *
_output_shapes
:
w
lossss_1/MeanMeanlossss_1/Reshape_2lossss_1/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
_
lossss_1/loss/tagConst*
dtype0*
valueB Blossss_1/loss*
_output_shapes
: 
d
lossss_1/lossHistogramSummarylossss_1/loss/taglossss_1/Mean*
T0*
_output_shapes
: 
[
lossss_1/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
]
lossss_1/gradients/ConstConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
t
lossss_1/gradients/FillFilllossss_1/gradients/Shapelossss_1/gradients/Const*
T0*
_output_shapes
: 
}
3lossss_1/gradients/lossss_1/Mean_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:
╣
-lossss_1/gradients/lossss_1/Mean_grad/ReshapeReshapelossss_1/gradients/Fill3lossss_1/gradients/lossss_1/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
}
+lossss_1/gradients/lossss_1/Mean_grad/ShapeShapelossss_1/Reshape_2*
T0*
out_type0*
_output_shapes
:
╬
*lossss_1/gradients/lossss_1/Mean_grad/TileTile-lossss_1/gradients/lossss_1/Mean_grad/Reshape+lossss_1/gradients/lossss_1/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         

-lossss_1/gradients/lossss_1/Mean_grad/Shape_1Shapelossss_1/Reshape_2*
T0*
out_type0*
_output_shapes
:
p
-lossss_1/gradients/lossss_1/Mean_grad/Shape_2Const*
dtype0*
valueB *
_output_shapes
: 
u
+lossss_1/gradients/lossss_1/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
╠
*lossss_1/gradients/lossss_1/Mean_grad/ProdProd-lossss_1/gradients/lossss_1/Mean_grad/Shape_1+lossss_1/gradients/lossss_1/Mean_grad/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
w
-lossss_1/gradients/lossss_1/Mean_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
л
,lossss_1/gradients/lossss_1/Mean_grad/Prod_1Prod-lossss_1/gradients/lossss_1/Mean_grad/Shape_2-lossss_1/gradients/lossss_1/Mean_grad/Const_1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
q
/lossss_1/gradients/lossss_1/Mean_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 
И
-lossss_1/gradients/lossss_1/Mean_grad/MaximumMaximum,lossss_1/gradients/lossss_1/Mean_grad/Prod_1/lossss_1/gradients/lossss_1/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
▒
.lossss_1/gradients/lossss_1/Mean_grad/floordivDiv*lossss_1/gradients/lossss_1/Mean_grad/Prod-lossss_1/gradients/lossss_1/Mean_grad/Maximum*
T0*
_output_shapes
: 
њ
*lossss_1/gradients/lossss_1/Mean_grad/CastCast.lossss_1/gradients/lossss_1/Mean_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 
║
-lossss_1/gradients/lossss_1/Mean_grad/truedivDiv*lossss_1/gradients/lossss_1/Mean_grad/Tile*lossss_1/gradients/lossss_1/Mean_grad/Cast*
T0*#
_output_shapes
:         
ќ
0lossss_1/gradients/lossss_1/Reshape_2_grad/ShapeShape&lossss_1/SoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
┌
2lossss_1/gradients/lossss_1/Reshape_2_grad/ReshapeReshape-lossss_1/gradients/lossss_1/Mean_grad/truediv0lossss_1/gradients/lossss_1/Reshape_2_grad/Shape*
T0*#
_output_shapes
:         *
Tshape0
Ј
lossss_1/gradients/zeros_like	ZerosLike(lossss_1/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
ў
Mlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
dtype0*
valueB :
         *
_output_shapes
: 
ў
Ilossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims2lossss_1/gradients/lossss_1/Reshape_2_grad/ReshapeMlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*

Tdim0*'
_output_shapes
:         
щ
Blossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/mulMulIlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims(lossss_1/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
|
.lossss_1/gradients/lossss_1/Reshape_grad/ShapeShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
№
0lossss_1/gradients/lossss_1/Reshape_grad/ReshapeReshapeBlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/mul.lossss_1/gradients/lossss_1/Reshape_grad/Shape*
T0*'
_output_shapes
:         +*
Tshape0
}
,lossss_1/gradients/Layer5FC_1/add_grad/ShapeShapeLayer5FC_1/MatMul*
T0*
out_type0*
_output_shapes
:
x
.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1Const*
dtype0*
valueB:+*
_output_shapes
:
­
<lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs,lossss_1/gradients/Layer5FC_1/add_grad/Shape.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
р
*lossss_1/gradients/Layer5FC_1/add_grad/SumSum0lossss_1/gradients/lossss_1/Reshape_grad/Reshape<lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
М
.lossss_1/gradients/Layer5FC_1/add_grad/ReshapeReshape*lossss_1/gradients/Layer5FC_1/add_grad/Sum,lossss_1/gradients/Layer5FC_1/add_grad/Shape*
T0*'
_output_shapes
:         +*
Tshape0
т
,lossss_1/gradients/Layer5FC_1/add_grad/Sum_1Sum0lossss_1/gradients/lossss_1/Reshape_grad/Reshape>lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╠
0lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1Reshape,lossss_1/gradients/Layer5FC_1/add_grad/Sum_1.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1*
T0*
_output_shapes
:+*
Tshape0
Б
7lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_depsNoOp/^lossss_1/gradients/Layer5FC_1/add_grad/Reshape1^lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1
ф
?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependencyIdentity.lossss_1/gradients/Layer5FC_1/add_grad/Reshape8^lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         +*A
_class7
53loc:@lossss_1/gradients/Layer5FC_1/add_grad/Reshape
Б
Alossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency_1Identity0lossss_1/gradients/Layer5FC_1/add_grad/Reshape_18^lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_deps*
T0*
_output_shapes
:+*C
_class9
75loc:@lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1
ь
0lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMulMatMul?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependencyLayer5FC_1/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         T
я
2lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1MatMulLayer4FC2_1/Relu?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:T+
ф
:lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul3^lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1
┤
Blossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul;^lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:         T*C
_class9
75loc:@lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul
▒
Dlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1;^lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:T+*E
_class;
97loc:@lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1
┼
1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGradReluGradBlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependencyLayer4FC2_1/Relu*
T0*'
_output_shapes
:         T

-lossss_1/gradients/Layer4FC2_1/add_grad/ShapeShapeLayer4FC2_1/MatMul*
T0*
out_type0*
_output_shapes
:
y
/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1Const*
dtype0*
valueB:T*
_output_shapes
:
з
=lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs-lossss_1/gradients/Layer4FC2_1/add_grad/Shape/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
С
+lossss_1/gradients/Layer4FC2_1/add_grad/SumSum1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGrad=lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
о
/lossss_1/gradients/Layer4FC2_1/add_grad/ReshapeReshape+lossss_1/gradients/Layer4FC2_1/add_grad/Sum-lossss_1/gradients/Layer4FC2_1/add_grad/Shape*
T0*'
_output_shapes
:         T*
Tshape0
У
-lossss_1/gradients/Layer4FC2_1/add_grad/Sum_1Sum1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGrad?lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
¤
1lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1Reshape-lossss_1/gradients/Layer4FC2_1/add_grad/Sum_1/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1*
T0*
_output_shapes
:T*
Tshape0
д
8lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_depsNoOp0^lossss_1/gradients/Layer4FC2_1/add_grad/Reshape2^lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1
«
@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependencyIdentity/lossss_1/gradients/Layer4FC2_1/add_grad/Reshape9^lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         T*B
_class8
64loc:@lossss_1/gradients/Layer4FC2_1/add_grad/Reshape
Д
Blossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency_1Identity1lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_19^lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_deps*
T0*
_output_shapes
:T*D
_class:
86loc:@lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1
­
1lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMulMatMul@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependencyLayer4FC2_1/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         x
Я
3lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1MatMulLayer3FC1_1/Relu@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:xT
Г
;lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_depsNoOp2^lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul4^lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1
И
Clossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependencyIdentity1lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul<^lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_deps*
T0*'
_output_shapes
:         x*D
_class:
86loc:@lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul
х
Elossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependency_1Identity3lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1<^lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:xT*F
_class<
:8loc:@lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1
к
1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGradReluGradClossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependencyLayer3FC1_1/Relu*
T0*'
_output_shapes
:         x

-lossss_1/gradients/Layer3FC1_1/add_grad/ShapeShapeLayer3FC1_1/MatMul*
T0*
out_type0*
_output_shapes
:
y
/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1Const*
dtype0*
valueB:x*
_output_shapes
:
з
=lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs-lossss_1/gradients/Layer3FC1_1/add_grad/Shape/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
С
+lossss_1/gradients/Layer3FC1_1/add_grad/SumSum1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGrad=lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
о
/lossss_1/gradients/Layer3FC1_1/add_grad/ReshapeReshape+lossss_1/gradients/Layer3FC1_1/add_grad/Sum-lossss_1/gradients/Layer3FC1_1/add_grad/Shape*
T0*'
_output_shapes
:         x*
Tshape0
У
-lossss_1/gradients/Layer3FC1_1/add_grad/Sum_1Sum1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGrad?lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
¤
1lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1Reshape-lossss_1/gradients/Layer3FC1_1/add_grad/Sum_1/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1*
T0*
_output_shapes
:x*
Tshape0
д
8lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_depsNoOp0^lossss_1/gradients/Layer3FC1_1/add_grad/Reshape2^lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1
«
@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependencyIdentity/lossss_1/gradients/Layer3FC1_1/add_grad/Reshape9^lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_deps*
T0*'
_output_shapes
:         x*B
_class8
64loc:@lossss_1/gradients/Layer3FC1_1/add_grad/Reshape
Д
Blossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency_1Identity1lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_19^lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_deps*
T0*
_output_shapes
:x*D
_class:
86loc:@lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1
ы
1lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMulMatMul@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependencyLayer3FC1_1/Variable/read*
T0*
transpose_b(*
transpose_a( *(
_output_shapes
:         љ
ь
3lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1MatMulLayer2ConV_1/Flatten/Reshape@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes
:	љx
Г
;lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_depsNoOp2^lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul4^lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1
╣
Clossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependencyIdentity1lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul<^lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_deps*
T0*(
_output_shapes
:         љ*D
_class:
86loc:@lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul
Х
Elossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency_1Identity3lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1<^lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes
:	љx*F
_class<
:8loc:@lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1
ј
:lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/ShapeShapeLayer2ConV_1/MaxPool*
T0*
out_type0*
_output_shapes
:
љ
<lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/ReshapeReshapeClossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency:lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/Shape*
T0*/
_output_shapes
:         *
Tshape0
╗
8lossss_1/gradients/Layer2ConV_1/MaxPool_grad/MaxPoolGradMaxPoolGradLayer2ConV_1/ReluLayer2ConV_1/MaxPool<lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/Reshape*
ksize
*
data_formatNHWC*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

┼
2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGradReluGrad8lossss_1/gradients/Layer2ConV_1/MaxPool_grad/MaxPoolGradLayer2ConV_1/Relu*
T0*/
_output_shapes
:         


Ђ
.lossss_1/gradients/Layer2ConV_1/add_grad/ShapeShapeLayer2ConV_1/Conv2D*
T0*
out_type0*
_output_shapes
:
z
0lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ш
>lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs.lossss_1/gradients/Layer2ConV_1/add_grad/Shape0lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
у
,lossss_1/gradients/Layer2ConV_1/add_grad/SumSum2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGrad>lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
р
0lossss_1/gradients/Layer2ConV_1/add_grad/ReshapeReshape,lossss_1/gradients/Layer2ConV_1/add_grad/Sum.lossss_1/gradients/Layer2ConV_1/add_grad/Shape*
T0*/
_output_shapes
:         

*
Tshape0
в
.lossss_1/gradients/Layer2ConV_1/add_grad/Sum_1Sum2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGrad@lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
м
2lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1Reshape.lossss_1/gradients/Layer2ConV_1/add_grad/Sum_10lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1*
T0*
_output_shapes
:*
Tshape0
Е
9lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer2ConV_1/add_grad/Reshape3^lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1
║
Alossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer2ConV_1/add_grad/Reshape:^lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_deps*
T0*/
_output_shapes
:         

*C
_class9
75loc:@lossss_1/gradients/Layer2ConV_1/add_grad/Reshape
Ф
Clossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1:^lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_deps*
T0*
_output_shapes
:*E
_class;
97loc:@lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1
Ё
1lossss_1/gradients/Layer2ConV_1/Conv2D_grad/ShapeShapeLayer1ConV_1/MaxPool*
T0*
out_type0*
_output_shapes
:
Ћ
?lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput1lossss_1/gradients/Layer2ConV_1/Conv2D_grad/ShapeLayer2ConV_1/Variable/readAlossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ї
3lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
№
@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterLayer1ConV_1/MaxPool3lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Shape_1Alossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

╔
<lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_depsNoOp@^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInputA^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter
я
Dlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependencyIdentity?lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInput=^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_deps*
T0*/
_output_shapes
:         *R
_classH
FDloc:@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInput
┘
Flossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency_1Identity@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter=^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_deps*
T0*&
_output_shapes
:*S
_classI
GEloc:@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter
├
8lossss_1/gradients/Layer1ConV_1/MaxPool_grad/MaxPoolGradMaxPoolGradLayer1ConV_1/ReluLayer1ConV_1/MaxPoolDlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

┼
2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGradReluGrad8lossss_1/gradients/Layer1ConV_1/MaxPool_grad/MaxPoolGradLayer1ConV_1/Relu*
T0*/
_output_shapes
:         
Ђ
.lossss_1/gradients/Layer1ConV_1/add_grad/ShapeShapeLayer1ConV_1/Conv2D*
T0*
out_type0*
_output_shapes
:
z
0lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ш
>lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs.lossss_1/gradients/Layer1ConV_1/add_grad/Shape0lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
у
,lossss_1/gradients/Layer1ConV_1/add_grad/SumSum2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGrad>lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
р
0lossss_1/gradients/Layer1ConV_1/add_grad/ReshapeReshape,lossss_1/gradients/Layer1ConV_1/add_grad/Sum.lossss_1/gradients/Layer1ConV_1/add_grad/Shape*
T0*/
_output_shapes
:         *
Tshape0
в
.lossss_1/gradients/Layer1ConV_1/add_grad/Sum_1Sum2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGrad@lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
м
2lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1Reshape.lossss_1/gradients/Layer1ConV_1/add_grad/Sum_10lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1*
T0*
_output_shapes
:*
Tshape0
Е
9lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer1ConV_1/add_grad/Reshape3^lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1
║
Alossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer1ConV_1/add_grad/Reshape:^lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_deps*
T0*/
_output_shapes
:         *C
_class9
75loc:@lossss_1/gradients/Layer1ConV_1/add_grad/Reshape
Ф
Clossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1:^lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_deps*
T0*
_output_shapes
:*E
_class;
97loc:@lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1
|
1lossss_1/gradients/Layer1ConV_1/Conv2D_grad/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:
Ћ
?lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput1lossss_1/gradients/Layer1ConV_1/Conv2D_grad/ShapeLayer1ConV_1/Variable/readAlossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ї
3lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
Т
@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterPlaceholder3lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Shape_1Alossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

╔
<lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_depsNoOp@^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInputA^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter
я
Dlossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependencyIdentity?lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInput=^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_deps*
T0*/
_output_shapes
:           *R
_classH
FDloc:@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInput
┘
Flossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependency_1Identity@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter=^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_deps*
T0*&
_output_shapes
:*S
_classI
GEloc:@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter
Љ
"lossss_1/beta1_power/initial_valueConst*
dtype0*
valueB
 *fff?*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
а
lossss_1/beta1_powerVariable*
dtype0*
shape: *(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *
_output_shapes
: 
М
lossss_1/beta1_power/AssignAssignlossss_1/beta1_power"lossss_1/beta1_power/initial_value*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
є
lossss_1/beta1_power/readIdentitylossss_1/beta1_power*
T0*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
Љ
"lossss_1/beta2_power/initial_valueConst*
dtype0*
valueB
 *wЙ?*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
а
lossss_1/beta2_powerVariable*
dtype0*
shape: *(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *
_output_shapes
: 
М
lossss_1/beta2_power/AssignAssignlossss_1/beta2_power"lossss_1/beta2_power/initial_value*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
є
lossss_1/beta2_power/readIdentitylossss_1/beta2_power*
T0*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
s
lossss_1/zerosConst*
dtype0*%
valueB*    *&
_output_shapes
:
¤
#lossss_1/Layer1ConV_1/Variable/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
ь
*lossss_1/Layer1ConV_1/Variable/Adam/AssignAssign#lossss_1/Layer1ConV_1/Variable/Adamlossss_1/zeros*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
┤
(lossss_1/Layer1ConV_1/Variable/Adam/readIdentity#lossss_1/Layer1ConV_1/Variable/Adam*
T0*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
u
lossss_1/zeros_1Const*
dtype0*%
valueB*    *&
_output_shapes
:
Л
%lossss_1/Layer1ConV_1/Variable/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
з
,lossss_1/Layer1ConV_1/Variable/Adam_1/AssignAssign%lossss_1/Layer1ConV_1/Variable/Adam_1lossss_1/zeros_1*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
И
*lossss_1/Layer1ConV_1/Variable/Adam_1/readIdentity%lossss_1/Layer1ConV_1/Variable/Adam_1*
T0*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
]
lossss_1/zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
╗
%lossss_1/Layer1ConV_1/Variable_1/AdamVariable*
dtype0*
shape:**
_class 
loc:@Layer1ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ж
,lossss_1/Layer1ConV_1/Variable_1/Adam/AssignAssign%lossss_1/Layer1ConV_1/Variable_1/Adamlossss_1/zeros_2*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
«
*lossss_1/Layer1ConV_1/Variable_1/Adam/readIdentity%lossss_1/Layer1ConV_1/Variable_1/Adam*
T0*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
]
lossss_1/zeros_3Const*
dtype0*
valueB*    *
_output_shapes
:
й
'lossss_1/Layer1ConV_1/Variable_1/Adam_1Variable*
dtype0*
shape:**
_class 
loc:@Layer1ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ь
.lossss_1/Layer1ConV_1/Variable_1/Adam_1/AssignAssign'lossss_1/Layer1ConV_1/Variable_1/Adam_1lossss_1/zeros_3*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
▓
,lossss_1/Layer1ConV_1/Variable_1/Adam_1/readIdentity'lossss_1/Layer1ConV_1/Variable_1/Adam_1*
T0*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
u
lossss_1/zeros_4Const*
dtype0*%
valueB*    *&
_output_shapes
:
¤
#lossss_1/Layer2ConV_1/Variable/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer2ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
№
*lossss_1/Layer2ConV_1/Variable/Adam/AssignAssign#lossss_1/Layer2ConV_1/Variable/Adamlossss_1/zeros_4*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
┤
(lossss_1/Layer2ConV_1/Variable/Adam/readIdentity#lossss_1/Layer2ConV_1/Variable/Adam*
T0*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
u
lossss_1/zeros_5Const*
dtype0*%
valueB*    *&
_output_shapes
:
Л
%lossss_1/Layer2ConV_1/Variable/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer2ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
з
,lossss_1/Layer2ConV_1/Variable/Adam_1/AssignAssign%lossss_1/Layer2ConV_1/Variable/Adam_1lossss_1/zeros_5*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
И
*lossss_1/Layer2ConV_1/Variable/Adam_1/readIdentity%lossss_1/Layer2ConV_1/Variable/Adam_1*
T0*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
]
lossss_1/zeros_6Const*
dtype0*
valueB*    *
_output_shapes
:
╗
%lossss_1/Layer2ConV_1/Variable_1/AdamVariable*
dtype0*
shape:**
_class 
loc:@Layer2ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ж
,lossss_1/Layer2ConV_1/Variable_1/Adam/AssignAssign%lossss_1/Layer2ConV_1/Variable_1/Adamlossss_1/zeros_6*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
«
*lossss_1/Layer2ConV_1/Variable_1/Adam/readIdentity%lossss_1/Layer2ConV_1/Variable_1/Adam*
T0*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
]
lossss_1/zeros_7Const*
dtype0*
valueB*    *
_output_shapes
:
й
'lossss_1/Layer2ConV_1/Variable_1/Adam_1Variable*
dtype0*
shape:**
_class 
loc:@Layer2ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ь
.lossss_1/Layer2ConV_1/Variable_1/Adam_1/AssignAssign'lossss_1/Layer2ConV_1/Variable_1/Adam_1lossss_1/zeros_7*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
▓
,lossss_1/Layer2ConV_1/Variable_1/Adam_1/readIdentity'lossss_1/Layer2ConV_1/Variable_1/Adam_1*
T0*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
g
lossss_1/zeros_8Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
┐
"lossss_1/Layer3FC1_1/Variable/AdamVariable*
dtype0*
shape:	љx*'
_class
loc:@Layer3FC1_1/Variable*
shared_name *
	container *
_output_shapes
:	љx
т
)lossss_1/Layer3FC1_1/Variable/Adam/AssignAssign"lossss_1/Layer3FC1_1/Variable/Adamlossss_1/zeros_8*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
ф
'lossss_1/Layer3FC1_1/Variable/Adam/readIdentity"lossss_1/Layer3FC1_1/Variable/Adam*
T0*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
g
lossss_1/zeros_9Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
┴
$lossss_1/Layer3FC1_1/Variable/Adam_1Variable*
dtype0*
shape:	љx*'
_class
loc:@Layer3FC1_1/Variable*
shared_name *
	container *
_output_shapes
:	љx
ж
+lossss_1/Layer3FC1_1/Variable/Adam_1/AssignAssign$lossss_1/Layer3FC1_1/Variable/Adam_1lossss_1/zeros_9*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
«
)lossss_1/Layer3FC1_1/Variable/Adam_1/readIdentity$lossss_1/Layer3FC1_1/Variable/Adam_1*
T0*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
^
lossss_1/zeros_10Const*
dtype0*
valueBx*    *
_output_shapes
:x
╣
$lossss_1/Layer3FC1_1/Variable_1/AdamVariable*
dtype0*
shape:x*)
_class
loc:@Layer3FC1_1/Variable_1*
shared_name *
	container *
_output_shapes
:x
у
+lossss_1/Layer3FC1_1/Variable_1/Adam/AssignAssign$lossss_1/Layer3FC1_1/Variable_1/Adamlossss_1/zeros_10*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
Ф
)lossss_1/Layer3FC1_1/Variable_1/Adam/readIdentity$lossss_1/Layer3FC1_1/Variable_1/Adam*
T0*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
^
lossss_1/zeros_11Const*
dtype0*
valueBx*    *
_output_shapes
:x
╗
&lossss_1/Layer3FC1_1/Variable_1/Adam_1Variable*
dtype0*
shape:x*)
_class
loc:@Layer3FC1_1/Variable_1*
shared_name *
	container *
_output_shapes
:x
в
-lossss_1/Layer3FC1_1/Variable_1/Adam_1/AssignAssign&lossss_1/Layer3FC1_1/Variable_1/Adam_1lossss_1/zeros_11*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
»
+lossss_1/Layer3FC1_1/Variable_1/Adam_1/readIdentity&lossss_1/Layer3FC1_1/Variable_1/Adam_1*
T0*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
f
lossss_1/zeros_12Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
й
"lossss_1/Layer4FC2_1/Variable/AdamVariable*
dtype0*
shape
:xT*'
_class
loc:@Layer4FC2_1/Variable*
shared_name *
	container *
_output_shapes

:xT
т
)lossss_1/Layer4FC2_1/Variable/Adam/AssignAssign"lossss_1/Layer4FC2_1/Variable/Adamlossss_1/zeros_12*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
Е
'lossss_1/Layer4FC2_1/Variable/Adam/readIdentity"lossss_1/Layer4FC2_1/Variable/Adam*
T0*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
f
lossss_1/zeros_13Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
┐
$lossss_1/Layer4FC2_1/Variable/Adam_1Variable*
dtype0*
shape
:xT*'
_class
loc:@Layer4FC2_1/Variable*
shared_name *
	container *
_output_shapes

:xT
ж
+lossss_1/Layer4FC2_1/Variable/Adam_1/AssignAssign$lossss_1/Layer4FC2_1/Variable/Adam_1lossss_1/zeros_13*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
Г
)lossss_1/Layer4FC2_1/Variable/Adam_1/readIdentity$lossss_1/Layer4FC2_1/Variable/Adam_1*
T0*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
^
lossss_1/zeros_14Const*
dtype0*
valueBT*    *
_output_shapes
:T
╣
$lossss_1/Layer4FC2_1/Variable_1/AdamVariable*
dtype0*
shape:T*)
_class
loc:@Layer4FC2_1/Variable_1*
shared_name *
	container *
_output_shapes
:T
у
+lossss_1/Layer4FC2_1/Variable_1/Adam/AssignAssign$lossss_1/Layer4FC2_1/Variable_1/Adamlossss_1/zeros_14*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
Ф
)lossss_1/Layer4FC2_1/Variable_1/Adam/readIdentity$lossss_1/Layer4FC2_1/Variable_1/Adam*
T0*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
^
lossss_1/zeros_15Const*
dtype0*
valueBT*    *
_output_shapes
:T
╗
&lossss_1/Layer4FC2_1/Variable_1/Adam_1Variable*
dtype0*
shape:T*)
_class
loc:@Layer4FC2_1/Variable_1*
shared_name *
	container *
_output_shapes
:T
в
-lossss_1/Layer4FC2_1/Variable_1/Adam_1/AssignAssign&lossss_1/Layer4FC2_1/Variable_1/Adam_1lossss_1/zeros_15*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
»
+lossss_1/Layer4FC2_1/Variable_1/Adam_1/readIdentity&lossss_1/Layer4FC2_1/Variable_1/Adam_1*
T0*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
f
lossss_1/zeros_16Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
╗
!lossss_1/Layer5FC_1/Variable/AdamVariable*
dtype0*
shape
:T+*&
_class
loc:@Layer5FC_1/Variable*
shared_name *
	container *
_output_shapes

:T+
Р
(lossss_1/Layer5FC_1/Variable/Adam/AssignAssign!lossss_1/Layer5FC_1/Variable/Adamlossss_1/zeros_16*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
д
&lossss_1/Layer5FC_1/Variable/Adam/readIdentity!lossss_1/Layer5FC_1/Variable/Adam*
T0*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
f
lossss_1/zeros_17Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
й
#lossss_1/Layer5FC_1/Variable/Adam_1Variable*
dtype0*
shape
:T+*&
_class
loc:@Layer5FC_1/Variable*
shared_name *
	container *
_output_shapes

:T+
Т
*lossss_1/Layer5FC_1/Variable/Adam_1/AssignAssign#lossss_1/Layer5FC_1/Variable/Adam_1lossss_1/zeros_17*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
ф
(lossss_1/Layer5FC_1/Variable/Adam_1/readIdentity#lossss_1/Layer5FC_1/Variable/Adam_1*
T0*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
^
lossss_1/zeros_18Const*
dtype0*
valueB+*    *
_output_shapes
:+
и
#lossss_1/Layer5FC_1/Variable_1/AdamVariable*
dtype0*
shape:+*(
_class
loc:@Layer5FC_1/Variable_1*
shared_name *
	container *
_output_shapes
:+
С
*lossss_1/Layer5FC_1/Variable_1/Adam/AssignAssign#lossss_1/Layer5FC_1/Variable_1/Adamlossss_1/zeros_18*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
е
(lossss_1/Layer5FC_1/Variable_1/Adam/readIdentity#lossss_1/Layer5FC_1/Variable_1/Adam*
T0*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
^
lossss_1/zeros_19Const*
dtype0*
valueB+*    *
_output_shapes
:+
╣
%lossss_1/Layer5FC_1/Variable_1/Adam_1Variable*
dtype0*
shape:+*(
_class
loc:@Layer5FC_1/Variable_1*
shared_name *
	container *
_output_shapes
:+
У
,lossss_1/Layer5FC_1/Variable_1/Adam_1/AssignAssign%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/zeros_19*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
г
*lossss_1/Layer5FC_1/Variable_1/Adam_1/readIdentity%lossss_1/Layer5FC_1/Variable_1/Adam_1*
T0*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
`
lossss_1/Adam/learning_rateConst*
dtype0*
valueB
 *oЃ:*
_output_shapes
: 
X
lossss_1/Adam/beta1Const*
dtype0*
valueB
 *fff?*
_output_shapes
: 
X
lossss_1/Adam/beta2Const*
dtype0*
valueB
 *wЙ?*
_output_shapes
: 
Z
lossss_1/Adam/epsilonConst*
dtype0*
valueB
 *w╠+2*
_output_shapes
: 
Ь
4lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam	ApplyAdamLayer1ConV_1/Variable#lossss_1/Layer1ConV_1/Variable/Adam%lossss_1/Layer1ConV_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonFlossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
ж
6lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam	ApplyAdamLayer1ConV_1/Variable_1%lossss_1/Layer1ConV_1/Variable_1/Adam'lossss_1/Layer1ConV_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonClossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
Ь
4lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam	ApplyAdamLayer2ConV_1/Variable#lossss_1/Layer2ConV_1/Variable/Adam%lossss_1/Layer2ConV_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonFlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
ж
6lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam	ApplyAdamLayer2ConV_1/Variable_1%lossss_1/Layer2ConV_1/Variable_1/Adam'lossss_1/Layer2ConV_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonClossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
р
3lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam	ApplyAdamLayer3FC1_1/Variable"lossss_1/Layer3FC1_1/Variable/Adam$lossss_1/Layer3FC1_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonElossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
с
5lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam	ApplyAdamLayer3FC1_1/Variable_1$lossss_1/Layer3FC1_1/Variable_1/Adam&lossss_1/Layer3FC1_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonBlossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
Я
3lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam	ApplyAdamLayer4FC2_1/Variable"lossss_1/Layer4FC2_1/Variable/Adam$lossss_1/Layer4FC2_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonElossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
с
5lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam	ApplyAdamLayer4FC2_1/Variable_1$lossss_1/Layer4FC2_1/Variable_1/Adam&lossss_1/Layer4FC2_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonBlossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
┌
2lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam	ApplyAdamLayer5FC_1/Variable!lossss_1/Layer5FC_1/Variable/Adam#lossss_1/Layer5FC_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonDlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
П
4lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam	ApplyAdamLayer5FC_1/Variable_1#lossss_1/Layer5FC_1/Variable_1/Adam%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonAlossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
╗
lossss_1/Adam/mulMullossss_1/beta1_power/readlossss_1/Adam/beta15^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam*
T0*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
╗
lossss_1/Adam/AssignAssignlossss_1/beta1_powerlossss_1/Adam/mul*
use_locking( *
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
й
lossss_1/Adam/mul_1Mullossss_1/beta2_power/readlossss_1/Adam/beta25^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam*
T0*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
┐
lossss_1/Adam/Assign_1Assignlossss_1/beta2_powerlossss_1/Adam/mul_1*
use_locking( *
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
ь
lossss_1/AdamNoOp5^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam^lossss_1/Adam/Assign^lossss_1/Adam/Assign_1
\
accuracyy/ArgMax/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
ђ
accuracyy/ArgMaxArgMaxLayer5FC_1/addaccuracyy/ArgMax/dimension*
T0*

Tidx0*#
_output_shapes
:         
^
accuracyy/ArgMax_1/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
r
accuracyy/ArgMax_1ArgMaxone_hotaccuracyy/ArgMax_1/dimension*
T0*

Tidx0*
_output_shapes
:
a
accuracyy/EqualEqualaccuracyy/ArgMaxaccuracyy/ArgMax_1*
T0	*
_output_shapes
:
Y
accuracyy/CastCastaccuracyy/Equal*

DstT0*

SrcT0
*
_output_shapes
:
G
accuracyy/RankRankaccuracyy/Cast*
T0*
_output_shapes
: 
W
accuracyy/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
W
accuracyy/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Є
accuracyy/rangeRangeaccuracyy/range/startaccuracyy/Rankaccuracyy/range/delta*

Tidx0*#
_output_shapes
:         
w
accuracyy/MeanMeanaccuracyy/Castaccuracyy/range*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
e
accuracyy/ScalarSummary/tagsConst*
dtype0*
valueB Baccuracy*
_output_shapes
: 
w
accuracyy/ScalarSummaryScalarSummaryaccuracyy/ScalarSummary/tagsaccuracyy/Mean*
T0*
_output_shapes
: 
R
save_1/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
ю
save_1/SaveV2/tensor_namesConst*
dtype0*═
value├B└@BLayer1ConV/VariableBLayer1ConV/Variable_1BLayer1ConV_1/VariableBLayer1ConV_1/Variable_1BLayer2ConV/VariableBLayer2ConV/Variable_1BLayer2ConV_1/VariableBLayer2ConV_1/Variable_1BLayer3FC1/VariableBLayer3FC1/Variable_1BLayer3FC1_1/VariableBLayer3FC1_1/Variable_1BLayer4FC2/VariableBLayer4FC2/Variable_1BLayer4FC2_1/VariableBLayer4FC2_1/Variable_1BLayer5FC/VariableBLayer5FC/Variable_1BLayer5FC_1/VariableBLayer5FC_1/Variable_1Blossss/Layer1ConV/Variable/AdamB!lossss/Layer1ConV/Variable/Adam_1B!lossss/Layer1ConV/Variable_1/AdamB#lossss/Layer1ConV/Variable_1/Adam_1Blossss/Layer2ConV/Variable/AdamB!lossss/Layer2ConV/Variable/Adam_1B!lossss/Layer2ConV/Variable_1/AdamB#lossss/Layer2ConV/Variable_1/Adam_1Blossss/Layer3FC1/Variable/AdamB lossss/Layer3FC1/Variable/Adam_1B lossss/Layer3FC1/Variable_1/AdamB"lossss/Layer3FC1/Variable_1/Adam_1Blossss/Layer4FC2/Variable/AdamB lossss/Layer4FC2/Variable/Adam_1B lossss/Layer4FC2/Variable_1/AdamB"lossss/Layer4FC2/Variable_1/Adam_1Blossss/Layer5FC/Variable/AdamBlossss/Layer5FC/Variable/Adam_1Blossss/Layer5FC/Variable_1/AdamB!lossss/Layer5FC/Variable_1/Adam_1Blossss/beta1_powerBlossss/beta2_powerB#lossss_1/Layer1ConV_1/Variable/AdamB%lossss_1/Layer1ConV_1/Variable/Adam_1B%lossss_1/Layer1ConV_1/Variable_1/AdamB'lossss_1/Layer1ConV_1/Variable_1/Adam_1B#lossss_1/Layer2ConV_1/Variable/AdamB%lossss_1/Layer2ConV_1/Variable/Adam_1B%lossss_1/Layer2ConV_1/Variable_1/AdamB'lossss_1/Layer2ConV_1/Variable_1/Adam_1B"lossss_1/Layer3FC1_1/Variable/AdamB$lossss_1/Layer3FC1_1/Variable/Adam_1B$lossss_1/Layer3FC1_1/Variable_1/AdamB&lossss_1/Layer3FC1_1/Variable_1/Adam_1B"lossss_1/Layer4FC2_1/Variable/AdamB$lossss_1/Layer4FC2_1/Variable/Adam_1B$lossss_1/Layer4FC2_1/Variable_1/AdamB&lossss_1/Layer4FC2_1/Variable_1/Adam_1B!lossss_1/Layer5FC_1/Variable/AdamB#lossss_1/Layer5FC_1/Variable/Adam_1B#lossss_1/Layer5FC_1/Variable_1/AdamB%lossss_1/Layer5FC_1/Variable_1/Adam_1Blossss_1/beta1_powerBlossss_1/beta2_power*
_output_shapes
:@
У
save_1/SaveV2/shape_and_slicesConst*
dtype0*Ћ
valueІBѕ@B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:@
ж
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesLayer1ConV/VariableLayer1ConV/Variable_1Layer1ConV_1/VariableLayer1ConV_1/Variable_1Layer2ConV/VariableLayer2ConV/Variable_1Layer2ConV_1/VariableLayer2ConV_1/Variable_1Layer3FC1/VariableLayer3FC1/Variable_1Layer3FC1_1/VariableLayer3FC1_1/Variable_1Layer4FC2/VariableLayer4FC2/Variable_1Layer4FC2_1/VariableLayer4FC2_1/Variable_1Layer5FC/VariableLayer5FC/Variable_1Layer5FC_1/VariableLayer5FC_1/Variable_1lossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_powerlossss/beta2_power#lossss_1/Layer1ConV_1/Variable/Adam%lossss_1/Layer1ConV_1/Variable/Adam_1%lossss_1/Layer1ConV_1/Variable_1/Adam'lossss_1/Layer1ConV_1/Variable_1/Adam_1#lossss_1/Layer2ConV_1/Variable/Adam%lossss_1/Layer2ConV_1/Variable/Adam_1%lossss_1/Layer2ConV_1/Variable_1/Adam'lossss_1/Layer2ConV_1/Variable_1/Adam_1"lossss_1/Layer3FC1_1/Variable/Adam$lossss_1/Layer3FC1_1/Variable/Adam_1$lossss_1/Layer3FC1_1/Variable_1/Adam&lossss_1/Layer3FC1_1/Variable_1/Adam_1"lossss_1/Layer4FC2_1/Variable/Adam$lossss_1/Layer4FC2_1/Variable/Adam_1$lossss_1/Layer4FC2_1/Variable_1/Adam&lossss_1/Layer4FC2_1/Variable_1/Adam_1!lossss_1/Layer5FC_1/Variable/Adam#lossss_1/Layer5FC_1/Variable/Adam_1#lossss_1/Layer5FC_1/Variable_1/Adam%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/beta1_powerlossss_1/beta2_power*N
dtypesD
B2@
Ё
save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
T0*
_output_shapes
: *
_class
loc:@save_1/Const
y
save_1/RestoreV2/tensor_namesConst*
dtype0*(
valueBBLayer1ConV/Variable*
_output_shapes
:
j
!save_1/RestoreV2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ў
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/AssignAssignLayer1ConV/Variablesave_1/RestoreV2*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
}
save_1/RestoreV2_1/tensor_namesConst*
dtype0**
value!BBLayer1ConV/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_1/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_1	RestoreV2save_1/Constsave_1/RestoreV2_1/tensor_names#save_1/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_1AssignLayer1ConV/Variable_1save_1/RestoreV2_1*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
}
save_1/RestoreV2_2/tensor_namesConst*
dtype0**
value!BBLayer1ConV_1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_2	RestoreV2save_1/Constsave_1/RestoreV2_2/tensor_names#save_1/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_2AssignLayer1ConV_1/Variablesave_1/RestoreV2_2*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable

save_1/RestoreV2_3/tensor_namesConst*
dtype0*,
value#B!BLayer1ConV_1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_3/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_3	RestoreV2save_1/Constsave_1/RestoreV2_3/tensor_names#save_1/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_3AssignLayer1ConV_1/Variable_1save_1/RestoreV2_3*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
{
save_1/RestoreV2_4/tensor_namesConst*
dtype0*(
valueBBLayer2ConV/Variable*
_output_shapes
:
l
#save_1/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_4	RestoreV2save_1/Constsave_1/RestoreV2_4/tensor_names#save_1/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save_1/Assign_4AssignLayer2ConV/Variablesave_1/RestoreV2_4*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
}
save_1/RestoreV2_5/tensor_namesConst*
dtype0**
value!BBLayer2ConV/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_5	RestoreV2save_1/Constsave_1/RestoreV2_5/tensor_names#save_1/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_5AssignLayer2ConV/Variable_1save_1/RestoreV2_5*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
}
save_1/RestoreV2_6/tensor_namesConst*
dtype0**
value!BBLayer2ConV_1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_6	RestoreV2save_1/Constsave_1/RestoreV2_6/tensor_names#save_1/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_6AssignLayer2ConV_1/Variablesave_1/RestoreV2_6*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable

save_1/RestoreV2_7/tensor_namesConst*
dtype0*,
value#B!BLayer2ConV_1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_7	RestoreV2save_1/Constsave_1/RestoreV2_7/tensor_names#save_1/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_7AssignLayer2ConV_1/Variable_1save_1/RestoreV2_7*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
z
save_1/RestoreV2_8/tensor_namesConst*
dtype0*'
valueBBLayer3FC1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_8	RestoreV2save_1/Constsave_1/RestoreV2_8/tensor_names#save_1/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
╗
save_1/Assign_8AssignLayer3FC1/Variablesave_1/RestoreV2_8*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
|
save_1/RestoreV2_9/tensor_namesConst*
dtype0*)
value BBLayer3FC1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_9/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_9	RestoreV2save_1/Constsave_1/RestoreV2_9/tensor_names#save_1/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_9AssignLayer3FC1/Variable_1save_1/RestoreV2_9*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
}
 save_1/RestoreV2_10/tensor_namesConst*
dtype0*)
value BBLayer3FC1_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_10	RestoreV2save_1/Const save_1/RestoreV2_10/tensor_names$save_1/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
┴
save_1/Assign_10AssignLayer3FC1_1/Variablesave_1/RestoreV2_10*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable

 save_1/RestoreV2_11/tensor_namesConst*
dtype0*+
value"B BLayer3FC1_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_11	RestoreV2save_1/Const save_1/RestoreV2_11/tensor_names$save_1/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_11AssignLayer3FC1_1/Variable_1save_1/RestoreV2_11*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
{
 save_1/RestoreV2_12/tensor_namesConst*
dtype0*'
valueBBLayer4FC2/Variable*
_output_shapes
:
m
$save_1/RestoreV2_12/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_12	RestoreV2save_1/Const save_1/RestoreV2_12/tensor_names$save_1/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_12AssignLayer4FC2/Variablesave_1/RestoreV2_12*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
}
 save_1/RestoreV2_13/tensor_namesConst*
dtype0*)
value BBLayer4FC2/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_13/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_13	RestoreV2save_1/Const save_1/RestoreV2_13/tensor_names$save_1/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_13AssignLayer4FC2/Variable_1save_1/RestoreV2_13*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
}
 save_1/RestoreV2_14/tensor_namesConst*
dtype0*)
value BBLayer4FC2_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_14/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_14	RestoreV2save_1/Const save_1/RestoreV2_14/tensor_names$save_1/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_14AssignLayer4FC2_1/Variablesave_1/RestoreV2_14*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable

 save_1/RestoreV2_15/tensor_namesConst*
dtype0*+
value"B BLayer4FC2_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_15/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_15	RestoreV2save_1/Const save_1/RestoreV2_15/tensor_names$save_1/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_15AssignLayer4FC2_1/Variable_1save_1/RestoreV2_15*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
z
 save_1/RestoreV2_16/tensor_namesConst*
dtype0*&
valueBBLayer5FC/Variable*
_output_shapes
:
m
$save_1/RestoreV2_16/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_16	RestoreV2save_1/Const save_1/RestoreV2_16/tensor_names$save_1/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_16AssignLayer5FC/Variablesave_1/RestoreV2_16*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
|
 save_1/RestoreV2_17/tensor_namesConst*
dtype0*(
valueBBLayer5FC/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_17/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_17	RestoreV2save_1/Const save_1/RestoreV2_17/tensor_names$save_1/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_17AssignLayer5FC/Variable_1save_1/RestoreV2_17*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
|
 save_1/RestoreV2_18/tensor_namesConst*
dtype0*(
valueBBLayer5FC_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_18/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_18	RestoreV2save_1/Const save_1/RestoreV2_18/tensor_names$save_1/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
Й
save_1/Assign_18AssignLayer5FC_1/Variablesave_1/RestoreV2_18*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
~
 save_1/RestoreV2_19/tensor_namesConst*
dtype0**
value!BBLayer5FC_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_19/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_19	RestoreV2save_1/Const save_1/RestoreV2_19/tensor_names$save_1/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
Й
save_1/Assign_19AssignLayer5FC_1/Variable_1save_1/RestoreV2_19*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
ѕ
 save_1/RestoreV2_20/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer1ConV/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_20/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_20	RestoreV2save_1/Const save_1/RestoreV2_20/tensor_names$save_1/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_20Assignlossss/Layer1ConV/Variable/Adamsave_1/RestoreV2_20*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
і
 save_1/RestoreV2_21/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_21/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_21	RestoreV2save_1/Const save_1/RestoreV2_21/tensor_names$save_1/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
н
save_1/Assign_21Assign!lossss/Layer1ConV/Variable/Adam_1save_1/RestoreV2_21*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer1ConV/Variable
і
 save_1/RestoreV2_22/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_22/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_22	RestoreV2save_1/Const save_1/RestoreV2_22/tensor_names$save_1/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_22Assign!lossss/Layer1ConV/Variable_1/Adamsave_1/RestoreV2_22*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
ї
 save_1/RestoreV2_23/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer1ConV/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_23/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_23	RestoreV2save_1/Const save_1/RestoreV2_23/tensor_names$save_1/RestoreV2_23/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_23Assign#lossss/Layer1ConV/Variable_1/Adam_1save_1/RestoreV2_23*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer1ConV/Variable_1
ѕ
 save_1/RestoreV2_24/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer2ConV/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_24/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_24	RestoreV2save_1/Const save_1/RestoreV2_24/tensor_names$save_1/RestoreV2_24/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_24Assignlossss/Layer2ConV/Variable/Adamsave_1/RestoreV2_24*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
і
 save_1/RestoreV2_25/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_25/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_25	RestoreV2save_1/Const save_1/RestoreV2_25/tensor_names$save_1/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
н
save_1/Assign_25Assign!lossss/Layer2ConV/Variable/Adam_1save_1/RestoreV2_25*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*&
_class
loc:@Layer2ConV/Variable
і
 save_1/RestoreV2_26/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_26/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_26	RestoreV2save_1/Const save_1/RestoreV2_26/tensor_names$save_1/RestoreV2_26/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_26Assign!lossss/Layer2ConV/Variable_1/Adamsave_1/RestoreV2_26*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
ї
 save_1/RestoreV2_27/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer2ConV/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_27/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_27	RestoreV2save_1/Const save_1/RestoreV2_27/tensor_names$save_1/RestoreV2_27/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_27Assign#lossss/Layer2ConV/Variable_1/Adam_1save_1/RestoreV2_27*
use_locking(*
T0*
validate_shape(*
_output_shapes
:*(
_class
loc:@Layer2ConV/Variable_1
Є
 save_1/RestoreV2_28/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer3FC1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_28/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_28	RestoreV2save_1/Const save_1/RestoreV2_28/tensor_names$save_1/RestoreV2_28/shape_and_slices*
dtypes
2*
_output_shapes
:
╔
save_1/Assign_28Assignlossss/Layer3FC1/Variable/Adamsave_1/RestoreV2_28*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
Ѕ
 save_1/RestoreV2_29/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_29/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_29	RestoreV2save_1/Const save_1/RestoreV2_29/tensor_names$save_1/RestoreV2_29/shape_and_slices*
dtypes
2*
_output_shapes
:
╦
save_1/Assign_29Assign lossss/Layer3FC1/Variable/Adam_1save_1/RestoreV2_29*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*%
_class
loc:@Layer3FC1/Variable
Ѕ
 save_1/RestoreV2_30/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_30/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_30	RestoreV2save_1/Const save_1/RestoreV2_30/tensor_names$save_1/RestoreV2_30/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_30Assign lossss/Layer3FC1/Variable_1/Adamsave_1/RestoreV2_30*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
І
 save_1/RestoreV2_31/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer3FC1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_31/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_31	RestoreV2save_1/Const save_1/RestoreV2_31/tensor_names$save_1/RestoreV2_31/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_31Assign"lossss/Layer3FC1/Variable_1/Adam_1save_1/RestoreV2_31*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*'
_class
loc:@Layer3FC1/Variable_1
Є
 save_1/RestoreV2_32/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer4FC2/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_32/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_32	RestoreV2save_1/Const save_1/RestoreV2_32/tensor_names$save_1/RestoreV2_32/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_32Assignlossss/Layer4FC2/Variable/Adamsave_1/RestoreV2_32*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Ѕ
 save_1/RestoreV2_33/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_33/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_33	RestoreV2save_1/Const save_1/RestoreV2_33/tensor_names$save_1/RestoreV2_33/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_33Assign lossss/Layer4FC2/Variable/Adam_1save_1/RestoreV2_33*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*%
_class
loc:@Layer4FC2/Variable
Ѕ
 save_1/RestoreV2_34/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_34/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_34	RestoreV2save_1/Const save_1/RestoreV2_34/tensor_names$save_1/RestoreV2_34/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_34Assign lossss/Layer4FC2/Variable_1/Adamsave_1/RestoreV2_34*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
І
 save_1/RestoreV2_35/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer4FC2/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_35/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_35	RestoreV2save_1/Const save_1/RestoreV2_35/tensor_names$save_1/RestoreV2_35/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_35Assign"lossss/Layer4FC2/Variable_1/Adam_1save_1/RestoreV2_35*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*'
_class
loc:@Layer4FC2/Variable_1
є
 save_1/RestoreV2_36/tensor_namesConst*
dtype0*2
value)B'Blossss/Layer5FC/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_36/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_36	RestoreV2save_1/Const save_1/RestoreV2_36/tensor_names$save_1/RestoreV2_36/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save_1/Assign_36Assignlossss/Layer5FC/Variable/Adamsave_1/RestoreV2_36*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
ѕ
 save_1/RestoreV2_37/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_37/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_37	RestoreV2save_1/Const save_1/RestoreV2_37/tensor_names$save_1/RestoreV2_37/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_37Assignlossss/Layer5FC/Variable/Adam_1save_1/RestoreV2_37*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*$
_class
loc:@Layer5FC/Variable
ѕ
 save_1/RestoreV2_38/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_38/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_38	RestoreV2save_1/Const save_1/RestoreV2_38/tensor_names$save_1/RestoreV2_38/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save_1/Assign_38Assignlossss/Layer5FC/Variable_1/Adamsave_1/RestoreV2_38*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
і
 save_1/RestoreV2_39/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer5FC/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_39/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_39	RestoreV2save_1/Const save_1/RestoreV2_39/tensor_names$save_1/RestoreV2_39/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_39Assign!lossss/Layer5FC/Variable_1/Adam_1save_1/RestoreV2_39*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*&
_class
loc:@Layer5FC/Variable_1
{
 save_1/RestoreV2_40/tensor_namesConst*
dtype0*'
valueBBlossss/beta1_power*
_output_shapes
:
m
$save_1/RestoreV2_40/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_40	RestoreV2save_1/Const save_1/RestoreV2_40/tensor_names$save_1/RestoreV2_40/shape_and_slices*
dtypes
2*
_output_shapes
:
х
save_1/Assign_40Assignlossss/beta1_powersave_1/RestoreV2_40*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
{
 save_1/RestoreV2_41/tensor_namesConst*
dtype0*'
valueBBlossss/beta2_power*
_output_shapes
:
m
$save_1/RestoreV2_41/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_41	RestoreV2save_1/Const save_1/RestoreV2_41/tensor_names$save_1/RestoreV2_41/shape_and_slices*
dtypes
2*
_output_shapes
:
х
save_1/Assign_41Assignlossss/beta2_powersave_1/RestoreV2_41*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *&
_class
loc:@Layer1ConV/Variable
ї
 save_1/RestoreV2_42/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer1ConV_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_42/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_42	RestoreV2save_1/Const save_1/RestoreV2_42/tensor_names$save_1/RestoreV2_42/shape_and_slices*
dtypes
2*
_output_shapes
:
п
save_1/Assign_42Assign#lossss_1/Layer1ConV_1/Variable/Adamsave_1/RestoreV2_42*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
ј
 save_1/RestoreV2_43/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer1ConV_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_43/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_43	RestoreV2save_1/Const save_1/RestoreV2_43/tensor_names$save_1/RestoreV2_43/shape_and_slices*
dtypes
2*
_output_shapes
:
┌
save_1/Assign_43Assign%lossss_1/Layer1ConV_1/Variable/Adam_1save_1/RestoreV2_43*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer1ConV_1/Variable
ј
 save_1/RestoreV2_44/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer1ConV_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_44/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_44	RestoreV2save_1/Const save_1/RestoreV2_44/tensor_names$save_1/RestoreV2_44/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_44Assign%lossss_1/Layer1ConV_1/Variable_1/Adamsave_1/RestoreV2_44*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
љ
 save_1/RestoreV2_45/tensor_namesConst*
dtype0*<
value3B1B'lossss_1/Layer1ConV_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_45/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_45	RestoreV2save_1/Const save_1/RestoreV2_45/tensor_names$save_1/RestoreV2_45/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_45Assign'lossss_1/Layer1ConV_1/Variable_1/Adam_1save_1/RestoreV2_45*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer1ConV_1/Variable_1
ї
 save_1/RestoreV2_46/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer2ConV_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_46/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_46	RestoreV2save_1/Const save_1/RestoreV2_46/tensor_names$save_1/RestoreV2_46/shape_and_slices*
dtypes
2*
_output_shapes
:
п
save_1/Assign_46Assign#lossss_1/Layer2ConV_1/Variable/Adamsave_1/RestoreV2_46*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
ј
 save_1/RestoreV2_47/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer2ConV_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_47/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_47	RestoreV2save_1/Const save_1/RestoreV2_47/tensor_names$save_1/RestoreV2_47/shape_and_slices*
dtypes
2*
_output_shapes
:
┌
save_1/Assign_47Assign%lossss_1/Layer2ConV_1/Variable/Adam_1save_1/RestoreV2_47*
use_locking(*
T0*
validate_shape(*&
_output_shapes
:*(
_class
loc:@Layer2ConV_1/Variable
ј
 save_1/RestoreV2_48/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer2ConV_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_48/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_48	RestoreV2save_1/Const save_1/RestoreV2_48/tensor_names$save_1/RestoreV2_48/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_48Assign%lossss_1/Layer2ConV_1/Variable_1/Adamsave_1/RestoreV2_48*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
љ
 save_1/RestoreV2_49/tensor_namesConst*
dtype0*<
value3B1B'lossss_1/Layer2ConV_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_49/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_49	RestoreV2save_1/Const save_1/RestoreV2_49/tensor_names$save_1/RestoreV2_49/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_49Assign'lossss_1/Layer2ConV_1/Variable_1/Adam_1save_1/RestoreV2_49*
use_locking(*
T0*
validate_shape(*
_output_shapes
:**
_class 
loc:@Layer2ConV_1/Variable_1
І
 save_1/RestoreV2_50/tensor_namesConst*
dtype0*7
value.B,B"lossss_1/Layer3FC1_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_50/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_50	RestoreV2save_1/Const save_1/RestoreV2_50/tensor_names$save_1/RestoreV2_50/shape_and_slices*
dtypes
2*
_output_shapes
:
¤
save_1/Assign_50Assign"lossss_1/Layer3FC1_1/Variable/Adamsave_1/RestoreV2_50*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
Ї
 save_1/RestoreV2_51/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer3FC1_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_51/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_51	RestoreV2save_1/Const save_1/RestoreV2_51/tensor_names$save_1/RestoreV2_51/shape_and_slices*
dtypes
2*
_output_shapes
:
Л
save_1/Assign_51Assign$lossss_1/Layer3FC1_1/Variable/Adam_1save_1/RestoreV2_51*
use_locking(*
T0*
validate_shape(*
_output_shapes
:	љx*'
_class
loc:@Layer3FC1_1/Variable
Ї
 save_1/RestoreV2_52/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer3FC1_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_52/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_52	RestoreV2save_1/Const save_1/RestoreV2_52/tensor_names$save_1/RestoreV2_52/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_52Assign$lossss_1/Layer3FC1_1/Variable_1/Adamsave_1/RestoreV2_52*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
Ј
 save_1/RestoreV2_53/tensor_namesConst*
dtype0*;
value2B0B&lossss_1/Layer3FC1_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_53/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_53	RestoreV2save_1/Const save_1/RestoreV2_53/tensor_names$save_1/RestoreV2_53/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_53Assign&lossss_1/Layer3FC1_1/Variable_1/Adam_1save_1/RestoreV2_53*
use_locking(*
T0*
validate_shape(*
_output_shapes
:x*)
_class
loc:@Layer3FC1_1/Variable_1
І
 save_1/RestoreV2_54/tensor_namesConst*
dtype0*7
value.B,B"lossss_1/Layer4FC2_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_54/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_54	RestoreV2save_1/Const save_1/RestoreV2_54/tensor_names$save_1/RestoreV2_54/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_54Assign"lossss_1/Layer4FC2_1/Variable/Adamsave_1/RestoreV2_54*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
Ї
 save_1/RestoreV2_55/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer4FC2_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_55/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_55	RestoreV2save_1/Const save_1/RestoreV2_55/tensor_names$save_1/RestoreV2_55/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_55Assign$lossss_1/Layer4FC2_1/Variable/Adam_1save_1/RestoreV2_55*
use_locking(*
T0*
validate_shape(*
_output_shapes

:xT*'
_class
loc:@Layer4FC2_1/Variable
Ї
 save_1/RestoreV2_56/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer4FC2_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_56/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_56	RestoreV2save_1/Const save_1/RestoreV2_56/tensor_names$save_1/RestoreV2_56/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_56Assign$lossss_1/Layer4FC2_1/Variable_1/Adamsave_1/RestoreV2_56*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
Ј
 save_1/RestoreV2_57/tensor_namesConst*
dtype0*;
value2B0B&lossss_1/Layer4FC2_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_57/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_57	RestoreV2save_1/Const save_1/RestoreV2_57/tensor_names$save_1/RestoreV2_57/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_57Assign&lossss_1/Layer4FC2_1/Variable_1/Adam_1save_1/RestoreV2_57*
use_locking(*
T0*
validate_shape(*
_output_shapes
:T*)
_class
loc:@Layer4FC2_1/Variable_1
і
 save_1/RestoreV2_58/tensor_namesConst*
dtype0*6
value-B+B!lossss_1/Layer5FC_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_58/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_58	RestoreV2save_1/Const save_1/RestoreV2_58/tensor_names$save_1/RestoreV2_58/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_58Assign!lossss_1/Layer5FC_1/Variable/Adamsave_1/RestoreV2_58*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
ї
 save_1/RestoreV2_59/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer5FC_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_59/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_59	RestoreV2save_1/Const save_1/RestoreV2_59/tensor_names$save_1/RestoreV2_59/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_59Assign#lossss_1/Layer5FC_1/Variable/Adam_1save_1/RestoreV2_59*
use_locking(*
T0*
validate_shape(*
_output_shapes

:T+*&
_class
loc:@Layer5FC_1/Variable
ї
 save_1/RestoreV2_60/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer5FC_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_60/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_60	RestoreV2save_1/Const save_1/RestoreV2_60/tensor_names$save_1/RestoreV2_60/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_60Assign#lossss_1/Layer5FC_1/Variable_1/Adamsave_1/RestoreV2_60*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
ј
 save_1/RestoreV2_61/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer5FC_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_61/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_61	RestoreV2save_1/Const save_1/RestoreV2_61/tensor_names$save_1/RestoreV2_61/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_61Assign%lossss_1/Layer5FC_1/Variable_1/Adam_1save_1/RestoreV2_61*
use_locking(*
T0*
validate_shape(*
_output_shapes
:+*(
_class
loc:@Layer5FC_1/Variable_1
}
 save_1/RestoreV2_62/tensor_namesConst*
dtype0*)
value BBlossss_1/beta1_power*
_output_shapes
:
m
$save_1/RestoreV2_62/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_62	RestoreV2save_1/Const save_1/RestoreV2_62/tensor_names$save_1/RestoreV2_62/shape_and_slices*
dtypes
2*
_output_shapes
:
╣
save_1/Assign_62Assignlossss_1/beta1_powersave_1/RestoreV2_62*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
}
 save_1/RestoreV2_63/tensor_namesConst*
dtype0*)
value BBlossss_1/beta2_power*
_output_shapes
:
m
$save_1/RestoreV2_63/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_63	RestoreV2save_1/Const save_1/RestoreV2_63/tensor_names$save_1/RestoreV2_63/shape_and_slices*
dtypes
2*
_output_shapes
:
╣
save_1/Assign_63Assignlossss_1/beta2_powersave_1/RestoreV2_63*
use_locking(*
T0*
validate_shape(*
_output_shapes
: *(
_class
loc:@Layer1ConV_1/Variable
╬	
save_1/restore_allNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63
ш
Merge_1/MergeSummaryMergeSummaryLayer1ConV/conv1_w_smryLayer2ConV/conv2_w_smryLayer3FC1/fc1_W_smryLayer4FC2/fc2_W_smryLayer5FC/fc3_W_smryaccuracy/ScalarSummaryLayer1ConV_1/conv1_w_smryLayer2ConV_1/conv2_w_smryLayer3FC1_1/fc1_W_smryLayer4FC2_1/fc2_W_smryLayer5FC_1/fc3_W_smrylossss_1/lossaccuracyy/ScalarSummary*
N*
_output_shapes
: 
к
init_1NoOp^Layer1ConV/Variable/Assign^Layer1ConV/Variable_1/Assign^Layer2ConV/Variable/Assign^Layer2ConV/Variable_1/Assign^Layer3FC1/Variable/Assign^Layer3FC1/Variable_1/Assign^Layer4FC2/Variable/Assign^Layer4FC2/Variable_1/Assign^Layer5FC/Variable/Assign^Layer5FC/Variable_1/Assign^lossss/beta1_power/Assign^lossss/beta2_power/Assign'^lossss/Layer1ConV/Variable/Adam/Assign)^lossss/Layer1ConV/Variable/Adam_1/Assign)^lossss/Layer1ConV/Variable_1/Adam/Assign+^lossss/Layer1ConV/Variable_1/Adam_1/Assign'^lossss/Layer2ConV/Variable/Adam/Assign)^lossss/Layer2ConV/Variable/Adam_1/Assign)^lossss/Layer2ConV/Variable_1/Adam/Assign+^lossss/Layer2ConV/Variable_1/Adam_1/Assign&^lossss/Layer3FC1/Variable/Adam/Assign(^lossss/Layer3FC1/Variable/Adam_1/Assign(^lossss/Layer3FC1/Variable_1/Adam/Assign*^lossss/Layer3FC1/Variable_1/Adam_1/Assign&^lossss/Layer4FC2/Variable/Adam/Assign(^lossss/Layer4FC2/Variable/Adam_1/Assign(^lossss/Layer4FC2/Variable_1/Adam/Assign*^lossss/Layer4FC2/Variable_1/Adam_1/Assign%^lossss/Layer5FC/Variable/Adam/Assign'^lossss/Layer5FC/Variable/Adam_1/Assign'^lossss/Layer5FC/Variable_1/Adam/Assign)^lossss/Layer5FC/Variable_1/Adam_1/Assign^Layer1ConV_1/Variable/Assign^Layer1ConV_1/Variable_1/Assign^Layer2ConV_1/Variable/Assign^Layer2ConV_1/Variable_1/Assign^Layer3FC1_1/Variable/Assign^Layer3FC1_1/Variable_1/Assign^Layer4FC2_1/Variable/Assign^Layer4FC2_1/Variable_1/Assign^Layer5FC_1/Variable/Assign^Layer5FC_1/Variable_1/Assign^lossss_1/beta1_power/Assign^lossss_1/beta2_power/Assign+^lossss_1/Layer1ConV_1/Variable/Adam/Assign-^lossss_1/Layer1ConV_1/Variable/Adam_1/Assign-^lossss_1/Layer1ConV_1/Variable_1/Adam/Assign/^lossss_1/Layer1ConV_1/Variable_1/Adam_1/Assign+^lossss_1/Layer2ConV_1/Variable/Adam/Assign-^lossss_1/Layer2ConV_1/Variable/Adam_1/Assign-^lossss_1/Layer2ConV_1/Variable_1/Adam/Assign/^lossss_1/Layer2ConV_1/Variable_1/Adam_1/Assign*^lossss_1/Layer3FC1_1/Variable/Adam/Assign,^lossss_1/Layer3FC1_1/Variable/Adam_1/Assign,^lossss_1/Layer3FC1_1/Variable_1/Adam/Assign.^lossss_1/Layer3FC1_1/Variable_1/Adam_1/Assign*^lossss_1/Layer4FC2_1/Variable/Adam/Assign,^lossss_1/Layer4FC2_1/Variable/Adam_1/Assign,^lossss_1/Layer4FC2_1/Variable_1/Adam/Assign.^lossss_1/Layer4FC2_1/Variable_1/Adam_1/Assign)^lossss_1/Layer5FC_1/Variable/Adam/Assign+^lossss_1/Layer5FC_1/Variable/Adam_1/Assign+^lossss_1/Layer5FC_1/Variable_1/Adam/Assign-^lossss_1/Layer5FC_1/Variable_1/Adam_1/Assign"╔`I*БL     .ѓЧ	aїдыAоAJќЎ
ћ%Ь$
9
Add
x"T
y"T
z"T"
Ttype:
2	
Л
	ApplyAdam
var"Tђ	
m"Tђ	
v"Tђ
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"Tђ"
Ttype:
2	"
use_lockingbool( 
l
ArgMax

input"T
	dimension"Tidx

output	"
Ttype:
2	"
Tidxtype0:
2	
x
Assign
ref"Tђ

value"T

output_ref"Tђ"	
Ttype"
validate_shapebool("
use_lockingbool(ў
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
N
Concat

concat_dim
values"T*N
output"T"
Nint(0"	
Ttype
8
Const
output"dtype"
valuetensor"
dtypetype
╔
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
№
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
Ь
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
9
Div
x"T
y"T
z"T"
Ttype:
2	
A
Equal
x"T
y"T
z
"
Ttype:
2	
љ
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
Й
MaxPool

input"T
output"T"
Ttype0:
2"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
С
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	љ
і
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
<
Mul
x"T
y"T
z"T"
Ttype:
2	љ

NoOp
ї
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint         "	
Ttype"
TItype0	:
2	
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
A
Placeholder
output"dtype"
dtypetype"
shapeshape: 
і
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
)
Rank

input"T

output"	
Ttype
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
i
SoftmaxCrossEntropyWithLogits
features"T
labels"T	
loss"T
backprop"T"
Ttype:
2
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
Ѕ
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	ѕ
q
Variable
ref"dtypeђ"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ѕ
&
	ZerosLike
x"T
y"T"	
Ttype*0.12.12v0.12.0-10-g4d924e7-dirtyЬФ
e
PlaceholderPlaceholder*
dtype0*
shape: */
_output_shapes
:           
P
Placeholder_1Placeholder*
dtype0*
shape: *
_output_shapes
:
U
one_hot/on_valueConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
V
one_hot/off_valueConst*
dtype0*
valueB
 *    *
_output_shapes
: 
O
one_hot/depthConst*
dtype0*
value	B :+*
_output_shapes
: 
ќ
one_hotOneHotPlaceholder_1one_hot/depthone_hot/on_valueone_hot/off_value*
axis         *
T0*
TI0*
_output_shapes
:
z
!Layer1ConV/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
e
 Layer1ConV/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer1ConV/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
И
+Layer1ConV/truncated_normal/TruncatedNormalTruncatedNormal!Layer1ConV/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*&
_output_shapes
:
е
Layer1ConV/truncated_normal/mulMul+Layer1ConV/truncated_normal/TruncatedNormal"Layer1ConV/truncated_normal/stddev*
T0*&
_output_shapes
:
ќ
Layer1ConV/truncated_normalAddLayer1ConV/truncated_normal/mul Layer1ConV/truncated_normal/mean*
T0*&
_output_shapes
:
Ћ
Layer1ConV/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
п
Layer1ConV/Variable/AssignAssignLayer1ConV/VariableLayer1ConV/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
њ
Layer1ConV/Variable/readIdentityLayer1ConV/Variable*
T0*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
s
Layer1ConV/conv1_w_smry/tagConst*
dtype0*(
valueB BLayer1ConV/conv1_w_smry*
_output_shapes
: 
Ѓ
Layer1ConV/conv1_w_smryHistogramSummaryLayer1ConV/conv1_w_smry/tagLayer1ConV/Variable/read*
T0*
_output_shapes
: 
]
Layer1ConV/zerosConst*
dtype0*
valueB*    *
_output_shapes
:

Layer1ConV/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
К
Layer1ConV/Variable_1/AssignAssignLayer1ConV/Variable_1Layer1ConV/zeros*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
ї
Layer1ConV/Variable_1/readIdentityLayer1ConV/Variable_1*
T0*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
н
Layer1ConV/Conv2DConv2DPlaceholderLayer1ConV/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         *
T0*
paddingVALID*
strides

~
Layer1ConV/addAddLayer1ConV/Conv2DLayer1ConV/Variable_1/read*
T0*/
_output_shapes
:         
a
Layer1ConV/ReluReluLayer1ConV/add*
T0*/
_output_shapes
:         
╗
Layer1ConV/MaxPoolMaxPoolLayer1ConV/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

z
!Layer2ConV/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
e
 Layer2ConV/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer2ConV/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
И
+Layer2ConV/truncated_normal/TruncatedNormalTruncatedNormal!Layer2ConV/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*&
_output_shapes
:
е
Layer2ConV/truncated_normal/mulMul+Layer2ConV/truncated_normal/TruncatedNormal"Layer2ConV/truncated_normal/stddev*
T0*&
_output_shapes
:
ќ
Layer2ConV/truncated_normalAddLayer2ConV/truncated_normal/mul Layer2ConV/truncated_normal/mean*
T0*&
_output_shapes
:
Ћ
Layer2ConV/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
п
Layer2ConV/Variable/AssignAssignLayer2ConV/VariableLayer2ConV/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
њ
Layer2ConV/Variable/readIdentityLayer2ConV/Variable*
T0*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
s
Layer2ConV/conv2_w_smry/tagConst*
dtype0*(
valueB BLayer2ConV/conv2_w_smry*
_output_shapes
: 
Ѓ
Layer2ConV/conv2_w_smryHistogramSummaryLayer2ConV/conv2_w_smry/tagLayer2ConV/Variable/read*
T0*
_output_shapes
: 
]
Layer2ConV/zerosConst*
dtype0*
valueB*    *
_output_shapes
:

Layer2ConV/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
К
Layer2ConV/Variable_1/AssignAssignLayer2ConV/Variable_1Layer2ConV/zeros*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
ї
Layer2ConV/Variable_1/readIdentityLayer2ConV/Variable_1*
T0*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
█
Layer2ConV/Conv2DConv2DLayer1ConV/MaxPoolLayer2ConV/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

~
Layer2ConV/addAddLayer2ConV/Conv2DLayer2ConV/Variable_1/read*
T0*/
_output_shapes
:         


a
Layer2ConV/ReluReluLayer2ConV/add*
T0*/
_output_shapes
:         


╗
Layer2ConV/MaxPoolMaxPoolLayer2ConV/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

q
 Layer2ConV/Flatten/Reshape/shapeConst*
dtype0*
valueB"    љ  *
_output_shapes
:
ю
Layer2ConV/Flatten/ReshapeReshapeLayer2ConV/MaxPool Layer2ConV/Flatten/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:         љ
q
 Layer3FC1/truncated_normal/shapeConst*
dtype0*
valueB"љ  x   *
_output_shapes
:
d
Layer3FC1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
f
!Layer3FC1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
»
*Layer3FC1/truncated_normal/TruncatedNormalTruncatedNormal Layer3FC1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes
:	љx
ъ
Layer3FC1/truncated_normal/mulMul*Layer3FC1/truncated_normal/TruncatedNormal!Layer3FC1/truncated_normal/stddev*
T0*
_output_shapes
:	љx
ї
Layer3FC1/truncated_normalAddLayer3FC1/truncated_normal/mulLayer3FC1/truncated_normal/mean*
T0*
_output_shapes
:	љx
є
Layer3FC1/VariableVariable*
dtype0*
	container *
shared_name *
shape:	љx*
_output_shapes
:	љx
═
Layer3FC1/Variable/AssignAssignLayer3FC1/VariableLayer3FC1/truncated_normal*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
ѕ
Layer3FC1/Variable/readIdentityLayer3FC1/Variable*
T0*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
m
Layer3FC1/fc1_W_smry/tagConst*
dtype0*%
valueB BLayer3FC1/fc1_W_smry*
_output_shapes
: 
|
Layer3FC1/fc1_W_smryHistogramSummaryLayer3FC1/fc1_W_smry/tagLayer3FC1/Variable/read*
T0*
_output_shapes
: 
\
Layer3FC1/zerosConst*
dtype0*
valueBx*    *
_output_shapes
:x
~
Layer3FC1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:x*
_output_shapes
:x
├
Layer3FC1/Variable_1/AssignAssignLayer3FC1/Variable_1Layer3FC1/zeros*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Ѕ
Layer3FC1/Variable_1/readIdentityLayer3FC1/Variable_1*
T0*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Д
Layer3FC1/MatMulMatMulLayer2ConV/Flatten/ReshapeLayer3FC1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         x
s
Layer3FC1/addAddLayer3FC1/MatMulLayer3FC1/Variable_1/read*
T0*'
_output_shapes
:         x
W
Layer3FC1/ReluReluLayer3FC1/add*
T0*'
_output_shapes
:         x
q
 Layer4FC2/truncated_normal/shapeConst*
dtype0*
valueB"x   T   *
_output_shapes
:
d
Layer4FC2/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
f
!Layer4FC2/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
«
*Layer4FC2/truncated_normal/TruncatedNormalTruncatedNormal Layer4FC2/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes

:xT
Ю
Layer4FC2/truncated_normal/mulMul*Layer4FC2/truncated_normal/TruncatedNormal!Layer4FC2/truncated_normal/stddev*
T0*
_output_shapes

:xT
І
Layer4FC2/truncated_normalAddLayer4FC2/truncated_normal/mulLayer4FC2/truncated_normal/mean*
T0*
_output_shapes

:xT
ё
Layer4FC2/VariableVariable*
dtype0*
	container *
shared_name *
shape
:xT*
_output_shapes

:xT
╠
Layer4FC2/Variable/AssignAssignLayer4FC2/VariableLayer4FC2/truncated_normal*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Є
Layer4FC2/Variable/readIdentityLayer4FC2/Variable*
T0*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
m
Layer4FC2/fc2_W_smry/tagConst*
dtype0*%
valueB BLayer4FC2/fc2_W_smry*
_output_shapes
: 
|
Layer4FC2/fc2_W_smryHistogramSummaryLayer4FC2/fc2_W_smry/tagLayer4FC2/Variable/read*
T0*
_output_shapes
: 
\
Layer4FC2/zerosConst*
dtype0*
valueBT*    *
_output_shapes
:T
~
Layer4FC2/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:T*
_output_shapes
:T
├
Layer4FC2/Variable_1/AssignAssignLayer4FC2/Variable_1Layer4FC2/zeros*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
Ѕ
Layer4FC2/Variable_1/readIdentityLayer4FC2/Variable_1*
T0*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
Џ
Layer4FC2/MatMulMatMulLayer3FC1/ReluLayer4FC2/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         T
s
Layer4FC2/addAddLayer4FC2/MatMulLayer4FC2/Variable_1/read*
T0*'
_output_shapes
:         T
W
Layer4FC2/ReluReluLayer4FC2/add*
T0*'
_output_shapes
:         T
p
Layer5FC/truncated_normal/shapeConst*
dtype0*
valueB"T   +   *
_output_shapes
:
c
Layer5FC/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
e
 Layer5FC/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
г
)Layer5FC/truncated_normal/TruncatedNormalTruncatedNormalLayer5FC/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes

:T+
џ
Layer5FC/truncated_normal/mulMul)Layer5FC/truncated_normal/TruncatedNormal Layer5FC/truncated_normal/stddev*
T0*
_output_shapes

:T+
ѕ
Layer5FC/truncated_normalAddLayer5FC/truncated_normal/mulLayer5FC/truncated_normal/mean*
T0*
_output_shapes

:T+
Ѓ
Layer5FC/VariableVariable*
dtype0*
	container *
shared_name *
shape
:T+*
_output_shapes

:T+
╚
Layer5FC/Variable/AssignAssignLayer5FC/VariableLayer5FC/truncated_normal*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
ё
Layer5FC/Variable/readIdentityLayer5FC/Variable*
T0*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
k
Layer5FC/fc3_W_smry/tagConst*
dtype0*$
valueB BLayer5FC/fc3_W_smry*
_output_shapes
: 
y
Layer5FC/fc3_W_smryHistogramSummaryLayer5FC/fc3_W_smry/tagLayer5FC/Variable/read*
T0*
_output_shapes
: 
[
Layer5FC/zerosConst*
dtype0*
valueB+*    *
_output_shapes
:+
}
Layer5FC/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:+*
_output_shapes
:+
┐
Layer5FC/Variable_1/AssignAssignLayer5FC/Variable_1Layer5FC/zeros*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
є
Layer5FC/Variable_1/readIdentityLayer5FC/Variable_1*
T0*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
Ў
Layer5FC/MatMulMatMulLayer4FC2/ReluLayer5FC/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         +
p
Layer5FC/addAddLayer5FC/MatMulLayer5FC/Variable_1/read*
T0*'
_output_shapes
:         +
M
lossss/RankConst*
dtype0*
value	B :*
_output_shapes
: 
X
lossss/ShapeShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
O
lossss/Rank_1Const*
dtype0*
value	B :*
_output_shapes
: 
Z
lossss/Shape_1ShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
N
lossss/Sub/yConst*
dtype0*
value	B :*
_output_shapes
: 
O

lossss/SubSublossss/Rank_1lossss/Sub/y*
T0*
_output_shapes
: 
`
lossss/Slice/beginPack
lossss/Sub*
N*
T0*

axis *
_output_shapes
:
[
lossss/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
~
lossss/SliceSlicelossss/Shape_1lossss/Slice/beginlossss/Slice/size*
Index0*
T0*
_output_shapes
:
Z
lossss/concat/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
i
lossss/concat/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ё
lossss/concatConcatlossss/concat/concat_dimlossss/concat/values_0lossss/Slice*
N*
T0*
_output_shapes
:

lossss/ReshapeReshapeLayer5FC/addlossss/concat*
T0*
Tshape0*0
_output_shapes
:                  
?
lossss/Rank_2Rankone_hot*
T0*
_output_shapes
: 
^
lossss/Shape_2Shapeone_hot*
T0*
out_type0*#
_output_shapes
:         
P
lossss/Sub_1/yConst*
dtype0*
value	B :*
_output_shapes
: 
S
lossss/Sub_1Sublossss/Rank_2lossss/Sub_1/y*
T0*
_output_shapes
: 
d
lossss/Slice_1/beginPacklossss/Sub_1*
N*
T0*

axis *
_output_shapes
:
]
lossss/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ё
lossss/Slice_1Slicelossss/Shape_2lossss/Slice_1/beginlossss/Slice_1/size*
Index0*
T0*
_output_shapes
:
\
lossss/concat_1/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
k
lossss/concat_1/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ї
lossss/concat_1Concatlossss/concat_1/concat_dimlossss/concat_1/values_0lossss/Slice_1*
N*
T0*
_output_shapes
:
~
lossss/Reshape_1Reshapeone_hotlossss/concat_1*
T0*
Tshape0*0
_output_shapes
:                  
▒
$lossss/SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogitslossss/Reshapelossss/Reshape_1*
T0*?
_output_shapes-
+:         :                  
P
lossss/Sub_2/yConst*
dtype0*
value	B :*
_output_shapes
: 
Q
lossss/Sub_2Sublossss/Ranklossss/Sub_2/y*
T0*
_output_shapes
: 
^
lossss/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
c
lossss/Slice_2/sizePacklossss/Sub_2*
N*
T0*

axis *
_output_shapes
:
І
lossss/Slice_2Slicelossss/Shapelossss/Slice_2/beginlossss/Slice_2/size*
Index0*
T0*#
_output_shapes
:         
Ї
lossss/Reshape_2Reshape$lossss/SoftmaxCrossEntropyWithLogitslossss/Slice_2*
T0*
Tshape0*#
_output_shapes
:         
V
lossss/ConstConst*
dtype0*
valueB: *
_output_shapes
:
q
lossss/MeanMeanlossss/Reshape_2lossss/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
Y
lossss/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
[
lossss/gradients/ConstConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
n
lossss/gradients/FillFilllossss/gradients/Shapelossss/gradients/Const*
T0*
_output_shapes
: 
y
/lossss/gradients/lossss/Mean_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:
»
)lossss/gradients/lossss/Mean_grad/ReshapeReshapelossss/gradients/Fill/lossss/gradients/lossss/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
w
'lossss/gradients/lossss/Mean_grad/ShapeShapelossss/Reshape_2*
T0*
out_type0*
_output_shapes
:
┬
&lossss/gradients/lossss/Mean_grad/TileTile)lossss/gradients/lossss/Mean_grad/Reshape'lossss/gradients/lossss/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         
y
)lossss/gradients/lossss/Mean_grad/Shape_1Shapelossss/Reshape_2*
T0*
out_type0*
_output_shapes
:
l
)lossss/gradients/lossss/Mean_grad/Shape_2Const*
dtype0*
valueB *
_output_shapes
: 
q
'lossss/gradients/lossss/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
└
&lossss/gradients/lossss/Mean_grad/ProdProd)lossss/gradients/lossss/Mean_grad/Shape_1'lossss/gradients/lossss/Mean_grad/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
s
)lossss/gradients/lossss/Mean_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
─
(lossss/gradients/lossss/Mean_grad/Prod_1Prod)lossss/gradients/lossss/Mean_grad/Shape_2)lossss/gradients/lossss/Mean_grad/Const_1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
m
+lossss/gradients/lossss/Mean_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 
г
)lossss/gradients/lossss/Mean_grad/MaximumMaximum(lossss/gradients/lossss/Mean_grad/Prod_1+lossss/gradients/lossss/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
Ц
*lossss/gradients/lossss/Mean_grad/floordivDiv&lossss/gradients/lossss/Mean_grad/Prod)lossss/gradients/lossss/Mean_grad/Maximum*
T0*
_output_shapes
: 
і
&lossss/gradients/lossss/Mean_grad/CastCast*lossss/gradients/lossss/Mean_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 
«
)lossss/gradients/lossss/Mean_grad/truedivDiv&lossss/gradients/lossss/Mean_grad/Tile&lossss/gradients/lossss/Mean_grad/Cast*
T0*#
_output_shapes
:         
љ
,lossss/gradients/lossss/Reshape_2_grad/ShapeShape$lossss/SoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
╬
.lossss/gradients/lossss/Reshape_2_grad/ReshapeReshape)lossss/gradients/lossss/Mean_grad/truediv,lossss/gradients/lossss/Reshape_2_grad/Shape*
T0*
Tshape0*#
_output_shapes
:         
І
lossss/gradients/zeros_like	ZerosLike&lossss/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
ћ
Ilossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
dtype0*
valueB :
         *
_output_shapes
: 
ї
Elossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims.lossss/gradients/lossss/Reshape_2_grad/ReshapeIlossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*

Tdim0*'
_output_shapes
:         
№
>lossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/mulMulElossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/ExpandDims&lossss/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
v
*lossss/gradients/lossss/Reshape_grad/ShapeShapeLayer5FC/add*
T0*
out_type0*
_output_shapes
:
с
,lossss/gradients/lossss/Reshape_grad/ReshapeReshape>lossss/gradients/lossss/SoftmaxCrossEntropyWithLogits_grad/mul*lossss/gradients/lossss/Reshape_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         +
w
(lossss/gradients/Layer5FC/add_grad/ShapeShapeLayer5FC/MatMul*
T0*
out_type0*
_output_shapes
:
t
*lossss/gradients/Layer5FC/add_grad/Shape_1Const*
dtype0*
valueB:+*
_output_shapes
:
С
8lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgsBroadcastGradientArgs(lossss/gradients/Layer5FC/add_grad/Shape*lossss/gradients/Layer5FC/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
Н
&lossss/gradients/Layer5FC/add_grad/SumSum,lossss/gradients/lossss/Reshape_grad/Reshape8lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
К
*lossss/gradients/Layer5FC/add_grad/ReshapeReshape&lossss/gradients/Layer5FC/add_grad/Sum(lossss/gradients/Layer5FC/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         +
┘
(lossss/gradients/Layer5FC/add_grad/Sum_1Sum,lossss/gradients/lossss/Reshape_grad/Reshape:lossss/gradients/Layer5FC/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
└
,lossss/gradients/Layer5FC/add_grad/Reshape_1Reshape(lossss/gradients/Layer5FC/add_grad/Sum_1*lossss/gradients/Layer5FC/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:+
Ќ
3lossss/gradients/Layer5FC/add_grad/tuple/group_depsNoOp+^lossss/gradients/Layer5FC/add_grad/Reshape-^lossss/gradients/Layer5FC/add_grad/Reshape_1
џ
;lossss/gradients/Layer5FC/add_grad/tuple/control_dependencyIdentity*lossss/gradients/Layer5FC/add_grad/Reshape4^lossss/gradients/Layer5FC/add_grad/tuple/group_deps*
T0*=
_class3
1/loc:@lossss/gradients/Layer5FC/add_grad/Reshape*'
_output_shapes
:         +
Њ
=lossss/gradients/Layer5FC/add_grad/tuple/control_dependency_1Identity,lossss/gradients/Layer5FC/add_grad/Reshape_14^lossss/gradients/Layer5FC/add_grad/tuple/group_deps*
T0*?
_class5
31loc:@lossss/gradients/Layer5FC/add_grad/Reshape_1*
_output_shapes
:+
с
,lossss/gradients/Layer5FC/MatMul_grad/MatMulMatMul;lossss/gradients/Layer5FC/add_grad/tuple/control_dependencyLayer5FC/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         T
н
.lossss/gradients/Layer5FC/MatMul_grad/MatMul_1MatMulLayer4FC2/Relu;lossss/gradients/Layer5FC/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:T+
ъ
6lossss/gradients/Layer5FC/MatMul_grad/tuple/group_depsNoOp-^lossss/gradients/Layer5FC/MatMul_grad/MatMul/^lossss/gradients/Layer5FC/MatMul_grad/MatMul_1
ц
>lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer5FC/MatMul_grad/MatMul7^lossss/gradients/Layer5FC/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@lossss/gradients/Layer5FC/MatMul_grad/MatMul*'
_output_shapes
:         T
А
@lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer5FC/MatMul_grad/MatMul_17^lossss/gradients/Layer5FC/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@lossss/gradients/Layer5FC/MatMul_grad/MatMul_1*
_output_shapes

:T+
╗
-lossss/gradients/Layer4FC2/Relu_grad/ReluGradReluGrad>lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependencyLayer4FC2/Relu*
T0*'
_output_shapes
:         T
y
)lossss/gradients/Layer4FC2/add_grad/ShapeShapeLayer4FC2/MatMul*
T0*
out_type0*
_output_shapes
:
u
+lossss/gradients/Layer4FC2/add_grad/Shape_1Const*
dtype0*
valueB:T*
_output_shapes
:
у
9lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgsBroadcastGradientArgs)lossss/gradients/Layer4FC2/add_grad/Shape+lossss/gradients/Layer4FC2/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
п
'lossss/gradients/Layer4FC2/add_grad/SumSum-lossss/gradients/Layer4FC2/Relu_grad/ReluGrad9lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╩
+lossss/gradients/Layer4FC2/add_grad/ReshapeReshape'lossss/gradients/Layer4FC2/add_grad/Sum)lossss/gradients/Layer4FC2/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         T
▄
)lossss/gradients/Layer4FC2/add_grad/Sum_1Sum-lossss/gradients/Layer4FC2/Relu_grad/ReluGrad;lossss/gradients/Layer4FC2/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
├
-lossss/gradients/Layer4FC2/add_grad/Reshape_1Reshape)lossss/gradients/Layer4FC2/add_grad/Sum_1+lossss/gradients/Layer4FC2/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:T
џ
4lossss/gradients/Layer4FC2/add_grad/tuple/group_depsNoOp,^lossss/gradients/Layer4FC2/add_grad/Reshape.^lossss/gradients/Layer4FC2/add_grad/Reshape_1
ъ
<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependencyIdentity+lossss/gradients/Layer4FC2/add_grad/Reshape5^lossss/gradients/Layer4FC2/add_grad/tuple/group_deps*
T0*>
_class4
20loc:@lossss/gradients/Layer4FC2/add_grad/Reshape*'
_output_shapes
:         T
Ќ
>lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency_1Identity-lossss/gradients/Layer4FC2/add_grad/Reshape_15^lossss/gradients/Layer4FC2/add_grad/tuple/group_deps*
T0*@
_class6
42loc:@lossss/gradients/Layer4FC2/add_grad/Reshape_1*
_output_shapes
:T
Т
-lossss/gradients/Layer4FC2/MatMul_grad/MatMulMatMul<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependencyLayer4FC2/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         x
о
/lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1MatMulLayer3FC1/Relu<lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:xT
А
7lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_depsNoOp.^lossss/gradients/Layer4FC2/MatMul_grad/MatMul0^lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1
е
?lossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependencyIdentity-lossss/gradients/Layer4FC2/MatMul_grad/MatMul8^lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_deps*
T0*@
_class6
42loc:@lossss/gradients/Layer4FC2/MatMul_grad/MatMul*'
_output_shapes
:         x
Ц
Alossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependency_1Identity/lossss/gradients/Layer4FC2/MatMul_grad/MatMul_18^lossss/gradients/Layer4FC2/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@lossss/gradients/Layer4FC2/MatMul_grad/MatMul_1*
_output_shapes

:xT
╝
-lossss/gradients/Layer3FC1/Relu_grad/ReluGradReluGrad?lossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependencyLayer3FC1/Relu*
T0*'
_output_shapes
:         x
y
)lossss/gradients/Layer3FC1/add_grad/ShapeShapeLayer3FC1/MatMul*
T0*
out_type0*
_output_shapes
:
u
+lossss/gradients/Layer3FC1/add_grad/Shape_1Const*
dtype0*
valueB:x*
_output_shapes
:
у
9lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgsBroadcastGradientArgs)lossss/gradients/Layer3FC1/add_grad/Shape+lossss/gradients/Layer3FC1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
п
'lossss/gradients/Layer3FC1/add_grad/SumSum-lossss/gradients/Layer3FC1/Relu_grad/ReluGrad9lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╩
+lossss/gradients/Layer3FC1/add_grad/ReshapeReshape'lossss/gradients/Layer3FC1/add_grad/Sum)lossss/gradients/Layer3FC1/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         x
▄
)lossss/gradients/Layer3FC1/add_grad/Sum_1Sum-lossss/gradients/Layer3FC1/Relu_grad/ReluGrad;lossss/gradients/Layer3FC1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
├
-lossss/gradients/Layer3FC1/add_grad/Reshape_1Reshape)lossss/gradients/Layer3FC1/add_grad/Sum_1+lossss/gradients/Layer3FC1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:x
џ
4lossss/gradients/Layer3FC1/add_grad/tuple/group_depsNoOp,^lossss/gradients/Layer3FC1/add_grad/Reshape.^lossss/gradients/Layer3FC1/add_grad/Reshape_1
ъ
<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependencyIdentity+lossss/gradients/Layer3FC1/add_grad/Reshape5^lossss/gradients/Layer3FC1/add_grad/tuple/group_deps*
T0*>
_class4
20loc:@lossss/gradients/Layer3FC1/add_grad/Reshape*'
_output_shapes
:         x
Ќ
>lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency_1Identity-lossss/gradients/Layer3FC1/add_grad/Reshape_15^lossss/gradients/Layer3FC1/add_grad/tuple/group_deps*
T0*@
_class6
42loc:@lossss/gradients/Layer3FC1/add_grad/Reshape_1*
_output_shapes
:x
у
-lossss/gradients/Layer3FC1/MatMul_grad/MatMulMatMul<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependencyLayer3FC1/Variable/read*
T0*
transpose_b(*
transpose_a( *(
_output_shapes
:         љ
с
/lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1MatMulLayer2ConV/Flatten/Reshape<lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes
:	љx
А
7lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_depsNoOp.^lossss/gradients/Layer3FC1/MatMul_grad/MatMul0^lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1
Е
?lossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependencyIdentity-lossss/gradients/Layer3FC1/MatMul_grad/MatMul8^lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_deps*
T0*@
_class6
42loc:@lossss/gradients/Layer3FC1/MatMul_grad/MatMul*(
_output_shapes
:         љ
д
Alossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency_1Identity/lossss/gradients/Layer3FC1/MatMul_grad/MatMul_18^lossss/gradients/Layer3FC1/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@lossss/gradients/Layer3FC1/MatMul_grad/MatMul_1*
_output_shapes
:	љx
ѕ
6lossss/gradients/Layer2ConV/Flatten/Reshape_grad/ShapeShapeLayer2ConV/MaxPool*
T0*
out_type0*
_output_shapes
:
ё
8lossss/gradients/Layer2ConV/Flatten/Reshape_grad/ReshapeReshape?lossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency6lossss/gradients/Layer2ConV/Flatten/Reshape_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         
»
4lossss/gradients/Layer2ConV/MaxPool_grad/MaxPoolGradMaxPoolGradLayer2ConV/ReluLayer2ConV/MaxPool8lossss/gradients/Layer2ConV/Flatten/Reshape_grad/Reshape*
ksize
*
data_formatNHWC*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

╗
.lossss/gradients/Layer2ConV/Relu_grad/ReluGradReluGrad4lossss/gradients/Layer2ConV/MaxPool_grad/MaxPoolGradLayer2ConV/Relu*
T0*/
_output_shapes
:         


{
*lossss/gradients/Layer2ConV/add_grad/ShapeShapeLayer2ConV/Conv2D*
T0*
out_type0*
_output_shapes
:
v
,lossss/gradients/Layer2ConV/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ж
:lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgsBroadcastGradientArgs*lossss/gradients/Layer2ConV/add_grad/Shape,lossss/gradients/Layer2ConV/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
█
(lossss/gradients/Layer2ConV/add_grad/SumSum.lossss/gradients/Layer2ConV/Relu_grad/ReluGrad:lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
Н
,lossss/gradients/Layer2ConV/add_grad/ReshapeReshape(lossss/gradients/Layer2ConV/add_grad/Sum*lossss/gradients/Layer2ConV/add_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         


▀
*lossss/gradients/Layer2ConV/add_grad/Sum_1Sum.lossss/gradients/Layer2ConV/Relu_grad/ReluGrad<lossss/gradients/Layer2ConV/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
к
.lossss/gradients/Layer2ConV/add_grad/Reshape_1Reshape*lossss/gradients/Layer2ConV/add_grad/Sum_1,lossss/gradients/Layer2ConV/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Ю
5lossss/gradients/Layer2ConV/add_grad/tuple/group_depsNoOp-^lossss/gradients/Layer2ConV/add_grad/Reshape/^lossss/gradients/Layer2ConV/add_grad/Reshape_1
ф
=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer2ConV/add_grad/Reshape6^lossss/gradients/Layer2ConV/add_grad/tuple/group_deps*
T0*?
_class5
31loc:@lossss/gradients/Layer2ConV/add_grad/Reshape*/
_output_shapes
:         


Џ
?lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer2ConV/add_grad/Reshape_16^lossss/gradients/Layer2ConV/add_grad/tuple/group_deps*
T0*A
_class7
53loc:@lossss/gradients/Layer2ConV/add_grad/Reshape_1*
_output_shapes
:

-lossss/gradients/Layer2ConV/Conv2D_grad/ShapeShapeLayer1ConV/MaxPool*
T0*
out_type0*
_output_shapes
:
Є
;lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput-lossss/gradients/Layer2ConV/Conv2D_grad/ShapeLayer2ConV/Variable/read=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ѕ
/lossss/gradients/Layer2ConV/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
р
<lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterLayer1ConV/MaxPool/lossss/gradients/Layer2ConV/Conv2D_grad/Shape_1=lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

й
8lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_depsNoOp<^lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput=^lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter
╬
@lossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependencyIdentity;lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput9^lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_deps*
T0*N
_classD
B@loc:@lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:         
╔
Blossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency_1Identity<lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter9^lossss/gradients/Layer2ConV/Conv2D_grad/tuple/group_deps*
T0*O
_classE
CAloc:@lossss/gradients/Layer2ConV/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
:
и
4lossss/gradients/Layer1ConV/MaxPool_grad/MaxPoolGradMaxPoolGradLayer1ConV/ReluLayer1ConV/MaxPool@lossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

╗
.lossss/gradients/Layer1ConV/Relu_grad/ReluGradReluGrad4lossss/gradients/Layer1ConV/MaxPool_grad/MaxPoolGradLayer1ConV/Relu*
T0*/
_output_shapes
:         
{
*lossss/gradients/Layer1ConV/add_grad/ShapeShapeLayer1ConV/Conv2D*
T0*
out_type0*
_output_shapes
:
v
,lossss/gradients/Layer1ConV/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ж
:lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgsBroadcastGradientArgs*lossss/gradients/Layer1ConV/add_grad/Shape,lossss/gradients/Layer1ConV/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
█
(lossss/gradients/Layer1ConV/add_grad/SumSum.lossss/gradients/Layer1ConV/Relu_grad/ReluGrad:lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
Н
,lossss/gradients/Layer1ConV/add_grad/ReshapeReshape(lossss/gradients/Layer1ConV/add_grad/Sum*lossss/gradients/Layer1ConV/add_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         
▀
*lossss/gradients/Layer1ConV/add_grad/Sum_1Sum.lossss/gradients/Layer1ConV/Relu_grad/ReluGrad<lossss/gradients/Layer1ConV/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
к
.lossss/gradients/Layer1ConV/add_grad/Reshape_1Reshape*lossss/gradients/Layer1ConV/add_grad/Sum_1,lossss/gradients/Layer1ConV/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Ю
5lossss/gradients/Layer1ConV/add_grad/tuple/group_depsNoOp-^lossss/gradients/Layer1ConV/add_grad/Reshape/^lossss/gradients/Layer1ConV/add_grad/Reshape_1
ф
=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependencyIdentity,lossss/gradients/Layer1ConV/add_grad/Reshape6^lossss/gradients/Layer1ConV/add_grad/tuple/group_deps*
T0*?
_class5
31loc:@lossss/gradients/Layer1ConV/add_grad/Reshape*/
_output_shapes
:         
Џ
?lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency_1Identity.lossss/gradients/Layer1ConV/add_grad/Reshape_16^lossss/gradients/Layer1ConV/add_grad/tuple/group_deps*
T0*A
_class7
53loc:@lossss/gradients/Layer1ConV/add_grad/Reshape_1*
_output_shapes
:
x
-lossss/gradients/Layer1ConV/Conv2D_grad/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:
Є
;lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput-lossss/gradients/Layer1ConV/Conv2D_grad/ShapeLayer1ConV/Variable/read=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ѕ
/lossss/gradients/Layer1ConV/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
┌
<lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterPlaceholder/lossss/gradients/Layer1ConV/Conv2D_grad/Shape_1=lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

й
8lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_depsNoOp<^lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput=^lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter
╬
@lossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependencyIdentity;lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput9^lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_deps*
T0*N
_classD
B@loc:@lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:           
╔
Blossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependency_1Identity<lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter9^lossss/gradients/Layer1ConV/Conv2D_grad/tuple/group_deps*
T0*O
_classE
CAloc:@lossss/gradients/Layer1ConV/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
:
Ї
 lossss/beta1_power/initial_valueConst*
dtype0*
valueB
 *fff?*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
ю
lossss/beta1_powerVariable*
dtype0*
shape: *&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *
_output_shapes
: 
╦
lossss/beta1_power/AssignAssignlossss/beta1_power lossss/beta1_power/initial_value*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
ђ
lossss/beta1_power/readIdentitylossss/beta1_power*
T0*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
Ї
 lossss/beta2_power/initial_valueConst*
dtype0*
valueB
 *wЙ?*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
ю
lossss/beta2_powerVariable*
dtype0*
shape: *&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *
_output_shapes
: 
╦
lossss/beta2_power/AssignAssignlossss/beta2_power lossss/beta2_power/initial_value*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
ђ
lossss/beta2_power/readIdentitylossss/beta2_power*
T0*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
q
lossss/zerosConst*
dtype0*%
valueB*    *&
_output_shapes
:
╔
lossss/Layer1ConV/Variable/AdamVariable*
dtype0*
shape:*&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *&
_output_shapes
:
р
&lossss/Layer1ConV/Variable/Adam/AssignAssignlossss/Layer1ConV/Variable/Adamlossss/zeros*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
ф
$lossss/Layer1ConV/Variable/Adam/readIdentitylossss/Layer1ConV/Variable/Adam*
T0*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
s
lossss/zeros_1Const*
dtype0*%
valueB*    *&
_output_shapes
:
╦
!lossss/Layer1ConV/Variable/Adam_1Variable*
dtype0*
shape:*&
_class
loc:@Layer1ConV/Variable*
shared_name *
	container *&
_output_shapes
:
у
(lossss/Layer1ConV/Variable/Adam_1/AssignAssign!lossss/Layer1ConV/Variable/Adam_1lossss/zeros_1*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
«
&lossss/Layer1ConV/Variable/Adam_1/readIdentity!lossss/Layer1ConV/Variable/Adam_1*
T0*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
[
lossss/zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
х
!lossss/Layer1ConV/Variable_1/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer1ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
П
(lossss/Layer1ConV/Variable_1/Adam/AssignAssign!lossss/Layer1ConV/Variable_1/Adamlossss/zeros_2*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
ц
&lossss/Layer1ConV/Variable_1/Adam/readIdentity!lossss/Layer1ConV/Variable_1/Adam*
T0*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
[
lossss/zeros_3Const*
dtype0*
valueB*    *
_output_shapes
:
и
#lossss/Layer1ConV/Variable_1/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer1ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
р
*lossss/Layer1ConV/Variable_1/Adam_1/AssignAssign#lossss/Layer1ConV/Variable_1/Adam_1lossss/zeros_3*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
е
(lossss/Layer1ConV/Variable_1/Adam_1/readIdentity#lossss/Layer1ConV/Variable_1/Adam_1*
T0*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
s
lossss/zeros_4Const*
dtype0*%
valueB*    *&
_output_shapes
:
╔
lossss/Layer2ConV/Variable/AdamVariable*
dtype0*
shape:*&
_class
loc:@Layer2ConV/Variable*
shared_name *
	container *&
_output_shapes
:
с
&lossss/Layer2ConV/Variable/Adam/AssignAssignlossss/Layer2ConV/Variable/Adamlossss/zeros_4*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
ф
$lossss/Layer2ConV/Variable/Adam/readIdentitylossss/Layer2ConV/Variable/Adam*
T0*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
s
lossss/zeros_5Const*
dtype0*%
valueB*    *&
_output_shapes
:
╦
!lossss/Layer2ConV/Variable/Adam_1Variable*
dtype0*
shape:*&
_class
loc:@Layer2ConV/Variable*
shared_name *
	container *&
_output_shapes
:
у
(lossss/Layer2ConV/Variable/Adam_1/AssignAssign!lossss/Layer2ConV/Variable/Adam_1lossss/zeros_5*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
«
&lossss/Layer2ConV/Variable/Adam_1/readIdentity!lossss/Layer2ConV/Variable/Adam_1*
T0*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
[
lossss/zeros_6Const*
dtype0*
valueB*    *
_output_shapes
:
х
!lossss/Layer2ConV/Variable_1/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer2ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
П
(lossss/Layer2ConV/Variable_1/Adam/AssignAssign!lossss/Layer2ConV/Variable_1/Adamlossss/zeros_6*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
ц
&lossss/Layer2ConV/Variable_1/Adam/readIdentity!lossss/Layer2ConV/Variable_1/Adam*
T0*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
[
lossss/zeros_7Const*
dtype0*
valueB*    *
_output_shapes
:
и
#lossss/Layer2ConV/Variable_1/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer2ConV/Variable_1*
shared_name *
	container *
_output_shapes
:
р
*lossss/Layer2ConV/Variable_1/Adam_1/AssignAssign#lossss/Layer2ConV/Variable_1/Adam_1lossss/zeros_7*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
е
(lossss/Layer2ConV/Variable_1/Adam_1/readIdentity#lossss/Layer2ConV/Variable_1/Adam_1*
T0*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
e
lossss/zeros_8Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
╣
lossss/Layer3FC1/Variable/AdamVariable*
dtype0*
shape:	љx*%
_class
loc:@Layer3FC1/Variable*
shared_name *
	container *
_output_shapes
:	љx
┘
%lossss/Layer3FC1/Variable/Adam/AssignAssignlossss/Layer3FC1/Variable/Adamlossss/zeros_8*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
а
#lossss/Layer3FC1/Variable/Adam/readIdentitylossss/Layer3FC1/Variable/Adam*
T0*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
e
lossss/zeros_9Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
╗
 lossss/Layer3FC1/Variable/Adam_1Variable*
dtype0*
shape:	љx*%
_class
loc:@Layer3FC1/Variable*
shared_name *
	container *
_output_shapes
:	љx
П
'lossss/Layer3FC1/Variable/Adam_1/AssignAssign lossss/Layer3FC1/Variable/Adam_1lossss/zeros_9*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
ц
%lossss/Layer3FC1/Variable/Adam_1/readIdentity lossss/Layer3FC1/Variable/Adam_1*
T0*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
\
lossss/zeros_10Const*
dtype0*
valueBx*    *
_output_shapes
:x
│
 lossss/Layer3FC1/Variable_1/AdamVariable*
dtype0*
shape:x*'
_class
loc:@Layer3FC1/Variable_1*
shared_name *
	container *
_output_shapes
:x
█
'lossss/Layer3FC1/Variable_1/Adam/AssignAssign lossss/Layer3FC1/Variable_1/Adamlossss/zeros_10*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
А
%lossss/Layer3FC1/Variable_1/Adam/readIdentity lossss/Layer3FC1/Variable_1/Adam*
T0*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
\
lossss/zeros_11Const*
dtype0*
valueBx*    *
_output_shapes
:x
х
"lossss/Layer3FC1/Variable_1/Adam_1Variable*
dtype0*
shape:x*'
_class
loc:@Layer3FC1/Variable_1*
shared_name *
	container *
_output_shapes
:x
▀
)lossss/Layer3FC1/Variable_1/Adam_1/AssignAssign"lossss/Layer3FC1/Variable_1/Adam_1lossss/zeros_11*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Ц
'lossss/Layer3FC1/Variable_1/Adam_1/readIdentity"lossss/Layer3FC1/Variable_1/Adam_1*
T0*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
d
lossss/zeros_12Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
и
lossss/Layer4FC2/Variable/AdamVariable*
dtype0*
shape
:xT*%
_class
loc:@Layer4FC2/Variable*
shared_name *
	container *
_output_shapes

:xT
┘
%lossss/Layer4FC2/Variable/Adam/AssignAssignlossss/Layer4FC2/Variable/Adamlossss/zeros_12*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Ъ
#lossss/Layer4FC2/Variable/Adam/readIdentitylossss/Layer4FC2/Variable/Adam*
T0*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
d
lossss/zeros_13Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
╣
 lossss/Layer4FC2/Variable/Adam_1Variable*
dtype0*
shape
:xT*%
_class
loc:@Layer4FC2/Variable*
shared_name *
	container *
_output_shapes

:xT
П
'lossss/Layer4FC2/Variable/Adam_1/AssignAssign lossss/Layer4FC2/Variable/Adam_1lossss/zeros_13*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Б
%lossss/Layer4FC2/Variable/Adam_1/readIdentity lossss/Layer4FC2/Variable/Adam_1*
T0*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
\
lossss/zeros_14Const*
dtype0*
valueBT*    *
_output_shapes
:T
│
 lossss/Layer4FC2/Variable_1/AdamVariable*
dtype0*
shape:T*'
_class
loc:@Layer4FC2/Variable_1*
shared_name *
	container *
_output_shapes
:T
█
'lossss/Layer4FC2/Variable_1/Adam/AssignAssign lossss/Layer4FC2/Variable_1/Adamlossss/zeros_14*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
А
%lossss/Layer4FC2/Variable_1/Adam/readIdentity lossss/Layer4FC2/Variable_1/Adam*
T0*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
\
lossss/zeros_15Const*
dtype0*
valueBT*    *
_output_shapes
:T
х
"lossss/Layer4FC2/Variable_1/Adam_1Variable*
dtype0*
shape:T*'
_class
loc:@Layer4FC2/Variable_1*
shared_name *
	container *
_output_shapes
:T
▀
)lossss/Layer4FC2/Variable_1/Adam_1/AssignAssign"lossss/Layer4FC2/Variable_1/Adam_1lossss/zeros_15*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
Ц
'lossss/Layer4FC2/Variable_1/Adam_1/readIdentity"lossss/Layer4FC2/Variable_1/Adam_1*
T0*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
d
lossss/zeros_16Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
х
lossss/Layer5FC/Variable/AdamVariable*
dtype0*
shape
:T+*$
_class
loc:@Layer5FC/Variable*
shared_name *
	container *
_output_shapes

:T+
о
$lossss/Layer5FC/Variable/Adam/AssignAssignlossss/Layer5FC/Variable/Adamlossss/zeros_16*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
ю
"lossss/Layer5FC/Variable/Adam/readIdentitylossss/Layer5FC/Variable/Adam*
T0*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
d
lossss/zeros_17Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
и
lossss/Layer5FC/Variable/Adam_1Variable*
dtype0*
shape
:T+*$
_class
loc:@Layer5FC/Variable*
shared_name *
	container *
_output_shapes

:T+
┌
&lossss/Layer5FC/Variable/Adam_1/AssignAssignlossss/Layer5FC/Variable/Adam_1lossss/zeros_17*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
а
$lossss/Layer5FC/Variable/Adam_1/readIdentitylossss/Layer5FC/Variable/Adam_1*
T0*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
\
lossss/zeros_18Const*
dtype0*
valueB+*    *
_output_shapes
:+
▒
lossss/Layer5FC/Variable_1/AdamVariable*
dtype0*
shape:+*&
_class
loc:@Layer5FC/Variable_1*
shared_name *
	container *
_output_shapes
:+
п
&lossss/Layer5FC/Variable_1/Adam/AssignAssignlossss/Layer5FC/Variable_1/Adamlossss/zeros_18*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
ъ
$lossss/Layer5FC/Variable_1/Adam/readIdentitylossss/Layer5FC/Variable_1/Adam*
T0*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
\
lossss/zeros_19Const*
dtype0*
valueB+*    *
_output_shapes
:+
│
!lossss/Layer5FC/Variable_1/Adam_1Variable*
dtype0*
shape:+*&
_class
loc:@Layer5FC/Variable_1*
shared_name *
	container *
_output_shapes
:+
▄
(lossss/Layer5FC/Variable_1/Adam_1/AssignAssign!lossss/Layer5FC/Variable_1/Adam_1lossss/zeros_19*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
б
&lossss/Layer5FC/Variable_1/Adam_1/readIdentity!lossss/Layer5FC/Variable_1/Adam_1*
T0*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
^
lossss/Adam/learning_rateConst*
dtype0*
valueB
 *oЃ:*
_output_shapes
: 
V
lossss/Adam/beta1Const*
dtype0*
valueB
 *fff?*
_output_shapes
: 
V
lossss/Adam/beta2Const*
dtype0*
valueB
 *wЙ?*
_output_shapes
: 
X
lossss/Adam/epsilonConst*
dtype0*
valueB
 *w╠+2*
_output_shapes
: 
╬
0lossss/Adam/update_Layer1ConV/Variable/ApplyAdam	ApplyAdamLayer1ConV/Variablelossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonBlossss/gradients/Layer1ConV/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
╔
2lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam	ApplyAdamLayer1ConV/Variable_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon?lossss/gradients/Layer1ConV/add_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
╬
0lossss/Adam/update_Layer2ConV/Variable/ApplyAdam	ApplyAdamLayer2ConV/Variablelossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonBlossss/gradients/Layer2ConV/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
╔
2lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam	ApplyAdamLayer2ConV/Variable_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon?lossss/gradients/Layer2ConV/add_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
┴
/lossss/Adam/update_Layer3FC1/Variable/ApplyAdam	ApplyAdamLayer3FC1/Variablelossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonAlossss/gradients/Layer3FC1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
├
1lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam	ApplyAdamLayer3FC1/Variable_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon>lossss/gradients/Layer3FC1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
└
/lossss/Adam/update_Layer4FC2/Variable/ApplyAdam	ApplyAdamLayer4FC2/Variablelossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilonAlossss/gradients/Layer4FC2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
├
1lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam	ApplyAdamLayer4FC2/Variable_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon>lossss/gradients/Layer4FC2/add_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
║
.lossss/Adam/update_Layer5FC/Variable/ApplyAdam	ApplyAdamLayer5FC/Variablelossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon@lossss/gradients/Layer5FC/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
й
0lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam	ApplyAdamLayer5FC/Variable_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_power/readlossss/beta2_power/readlossss/Adam/learning_ratelossss/Adam/beta1lossss/Adam/beta2lossss/Adam/epsilon=lossss/gradients/Layer5FC/add_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
І
lossss/Adam/mulMullossss/beta1_power/readlossss/Adam/beta11^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam*
T0*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
│
lossss/Adam/AssignAssignlossss/beta1_powerlossss/Adam/mul*
use_locking( *
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
Ї
lossss/Adam/mul_1Mullossss/beta2_power/readlossss/Adam/beta21^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam*
T0*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
и
lossss/Adam/Assign_1Assignlossss/beta2_powerlossss/Adam/mul_1*
use_locking( *
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
┐
lossss/AdamNoOp1^lossss/Adam/update_Layer1ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer1ConV/Variable_1/ApplyAdam1^lossss/Adam/update_Layer2ConV/Variable/ApplyAdam3^lossss/Adam/update_Layer2ConV/Variable_1/ApplyAdam0^lossss/Adam/update_Layer3FC1/Variable/ApplyAdam2^lossss/Adam/update_Layer3FC1/Variable_1/ApplyAdam0^lossss/Adam/update_Layer4FC2/Variable/ApplyAdam2^lossss/Adam/update_Layer4FC2/Variable_1/ApplyAdam/^lossss/Adam/update_Layer5FC/Variable/ApplyAdam1^lossss/Adam/update_Layer5FC/Variable_1/ApplyAdam^lossss/Adam/Assign^lossss/Adam/Assign_1
[
accuracy/ArgMax/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
|
accuracy/ArgMaxArgMaxLayer5FC/addaccuracy/ArgMax/dimension*
T0*

Tidx0*#
_output_shapes
:         
]
accuracy/ArgMax_1/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
p
accuracy/ArgMax_1ArgMaxone_hotaccuracy/ArgMax_1/dimension*
T0*

Tidx0*
_output_shapes
:
^
accuracy/EqualEqualaccuracy/ArgMaxaccuracy/ArgMax_1*
T0	*
_output_shapes
:
W
accuracy/CastCastaccuracy/Equal*

DstT0*

SrcT0
*
_output_shapes
:
E
accuracy/RankRankaccuracy/Cast*
T0*
_output_shapes
: 
V
accuracy/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
V
accuracy/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Ѓ
accuracy/rangeRangeaccuracy/range/startaccuracy/Rankaccuracy/range/delta*

Tidx0*#
_output_shapes
:         
t
accuracy/MeanMeanaccuracy/Castaccuracy/range*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
d
accuracy/ScalarSummary/tagsConst*
dtype0*
valueB Baccuracy*
_output_shapes
: 
t
accuracy/ScalarSummaryScalarSummaryaccuracy/ScalarSummary/tagsaccuracy/Mean*
T0*
_output_shapes
: 
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
і
save/SaveV2/tensor_namesConst*
dtype0*й
value│B░ BLayer1ConV/VariableBLayer1ConV/Variable_1BLayer2ConV/VariableBLayer2ConV/Variable_1BLayer3FC1/VariableBLayer3FC1/Variable_1BLayer4FC2/VariableBLayer4FC2/Variable_1BLayer5FC/VariableBLayer5FC/Variable_1Blossss/Layer1ConV/Variable/AdamB!lossss/Layer1ConV/Variable/Adam_1B!lossss/Layer1ConV/Variable_1/AdamB#lossss/Layer1ConV/Variable_1/Adam_1Blossss/Layer2ConV/Variable/AdamB!lossss/Layer2ConV/Variable/Adam_1B!lossss/Layer2ConV/Variable_1/AdamB#lossss/Layer2ConV/Variable_1/Adam_1Blossss/Layer3FC1/Variable/AdamB lossss/Layer3FC1/Variable/Adam_1B lossss/Layer3FC1/Variable_1/AdamB"lossss/Layer3FC1/Variable_1/Adam_1Blossss/Layer4FC2/Variable/AdamB lossss/Layer4FC2/Variable/Adam_1B lossss/Layer4FC2/Variable_1/AdamB"lossss/Layer4FC2/Variable_1/Adam_1Blossss/Layer5FC/Variable/AdamBlossss/Layer5FC/Variable/Adam_1Blossss/Layer5FC/Variable_1/AdamB!lossss/Layer5FC/Variable_1/Adam_1Blossss/beta1_powerBlossss/beta2_power*
_output_shapes
: 
Б
save/SaveV2/shape_and_slicesConst*
dtype0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
: 
▒
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesLayer1ConV/VariableLayer1ConV/Variable_1Layer2ConV/VariableLayer2ConV/Variable_1Layer3FC1/VariableLayer3FC1/Variable_1Layer4FC2/VariableLayer4FC2/Variable_1Layer5FC/VariableLayer5FC/Variable_1lossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_powerlossss/beta2_power*.
dtypes$
"2 
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
w
save/RestoreV2/tensor_namesConst*
dtype0*(
valueBBLayer1ConV/Variable*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
љ
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save/AssignAssignLayer1ConV/Variablesave/RestoreV2*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
{
save/RestoreV2_1/tensor_namesConst*
dtype0**
value!BBLayer1ConV/Variable_1*
_output_shapes
:
j
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
И
save/Assign_1AssignLayer1ConV/Variable_1save/RestoreV2_1*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
y
save/RestoreV2_2/tensor_namesConst*
dtype0*(
valueBBLayer2ConV/Variable*
_output_shapes
:
j
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save/Assign_2AssignLayer2ConV/Variablesave/RestoreV2_2*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
{
save/RestoreV2_3/tensor_namesConst*
dtype0**
value!BBLayer2ConV/Variable_1*
_output_shapes
:
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
И
save/Assign_3AssignLayer2ConV/Variable_1save/RestoreV2_3*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
x
save/RestoreV2_4/tensor_namesConst*
dtype0*'
valueBBLayer3FC1/Variable*
_output_shapes
:
j
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
и
save/Assign_4AssignLayer3FC1/Variablesave/RestoreV2_4*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
z
save/RestoreV2_5/tensor_namesConst*
dtype0*)
value BBLayer3FC1/Variable_1*
_output_shapes
:
j
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_5AssignLayer3FC1/Variable_1save/RestoreV2_5*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
x
save/RestoreV2_6/tensor_namesConst*
dtype0*'
valueBBLayer4FC2/Variable*
_output_shapes
:
j
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_6AssignLayer4FC2/Variablesave/RestoreV2_6*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
z
save/RestoreV2_7/tensor_namesConst*
dtype0*)
value BBLayer4FC2/Variable_1*
_output_shapes
:
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
Х
save/Assign_7AssignLayer4FC2/Variable_1save/RestoreV2_7*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
w
save/RestoreV2_8/tensor_namesConst*
dtype0*&
valueBBLayer5FC/Variable*
_output_shapes
:
j
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
┤
save/Assign_8AssignLayer5FC/Variablesave/RestoreV2_8*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
y
save/RestoreV2_9/tensor_namesConst*
dtype0*(
valueBBLayer5FC/Variable_1*
_output_shapes
:
j
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ќ
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
┤
save/Assign_9AssignLayer5FC/Variable_1save/RestoreV2_9*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
є
save/RestoreV2_10/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer1ConV/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save/Assign_10Assignlossss/Layer1ConV/Variable/Adamsave/RestoreV2_10*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
ѕ
save/RestoreV2_11/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_11Assign!lossss/Layer1ConV/Variable/Adam_1save/RestoreV2_11*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
ѕ
save/RestoreV2_12/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_12Assign!lossss/Layer1ConV/Variable_1/Adamsave/RestoreV2_12*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
і
save/RestoreV2_13/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer1ConV/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_13Assign#lossss/Layer1ConV/Variable_1/Adam_1save/RestoreV2_13*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
є
save/RestoreV2_14/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer2ConV/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save/Assign_14Assignlossss/Layer2ConV/Variable/Adamsave/RestoreV2_14*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
ѕ
save/RestoreV2_15/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save/Assign_15Assign!lossss/Layer2ConV/Variable/Adam_1save/RestoreV2_15*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
ѕ
save/RestoreV2_16/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_16Assign!lossss/Layer2ConV/Variable_1/Adamsave/RestoreV2_16*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
і
save/RestoreV2_17/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer2ConV/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save/Assign_17Assign#lossss/Layer2ConV/Variable_1/Adam_1save/RestoreV2_17*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
Ё
save/RestoreV2_18/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer3FC1/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_18/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
┼
save/Assign_18Assignlossss/Layer3FC1/Variable/Adamsave/RestoreV2_18*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
Є
save/RestoreV2_19/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_19/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
К
save/Assign_19Assign lossss/Layer3FC1/Variable/Adam_1save/RestoreV2_19*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
Є
save/RestoreV2_20/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_20/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_20Assign lossss/Layer3FC1/Variable_1/Adamsave/RestoreV2_20*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Ѕ
save/RestoreV2_21/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer3FC1/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_21/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_21Assign"lossss/Layer3FC1/Variable_1/Adam_1save/RestoreV2_21*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Ё
save/RestoreV2_22/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer4FC2/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_22/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_22Assignlossss/Layer4FC2/Variable/Adamsave/RestoreV2_22*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Є
save/RestoreV2_23/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_23/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_23Assign lossss/Layer4FC2/Variable/Adam_1save/RestoreV2_23*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Є
save/RestoreV2_24/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_24/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_24Assign lossss/Layer4FC2/Variable_1/Adamsave/RestoreV2_24*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
Ѕ
save/RestoreV2_25/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer4FC2/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_25/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_25	RestoreV2
save/Constsave/RestoreV2_25/tensor_names"save/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save/Assign_25Assign"lossss/Layer4FC2/Variable_1/Adam_1save/RestoreV2_25*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
ё
save/RestoreV2_26/tensor_namesConst*
dtype0*2
value)B'Blossss/Layer5FC/Variable/Adam*
_output_shapes
:
k
"save/RestoreV2_26/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_26	RestoreV2
save/Constsave/RestoreV2_26/tensor_names"save/RestoreV2_26/shape_and_slices*
dtypes
2*
_output_shapes
:
┬
save/Assign_26Assignlossss/Layer5FC/Variable/Adamsave/RestoreV2_26*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
є
save/RestoreV2_27/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable/Adam_1*
_output_shapes
:
k
"save/RestoreV2_27/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_27	RestoreV2
save/Constsave/RestoreV2_27/tensor_names"save/RestoreV2_27/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_27Assignlossss/Layer5FC/Variable/Adam_1save/RestoreV2_27*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
є
save/RestoreV2_28/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable_1/Adam*
_output_shapes
:
k
"save/RestoreV2_28/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_28	RestoreV2
save/Constsave/RestoreV2_28/tensor_names"save/RestoreV2_28/shape_and_slices*
dtypes
2*
_output_shapes
:
┬
save/Assign_28Assignlossss/Layer5FC/Variable_1/Adamsave/RestoreV2_28*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
ѕ
save/RestoreV2_29/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer5FC/Variable_1/Adam_1*
_output_shapes
:
k
"save/RestoreV2_29/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_29	RestoreV2
save/Constsave/RestoreV2_29/tensor_names"save/RestoreV2_29/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save/Assign_29Assign!lossss/Layer5FC/Variable_1/Adam_1save/RestoreV2_29*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
y
save/RestoreV2_30/tensor_namesConst*
dtype0*'
valueBBlossss/beta1_power*
_output_shapes
:
k
"save/RestoreV2_30/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_30	RestoreV2
save/Constsave/RestoreV2_30/tensor_names"save/RestoreV2_30/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_30Assignlossss/beta1_powersave/RestoreV2_30*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
y
save/RestoreV2_31/tensor_namesConst*
dtype0*'
valueBBlossss/beta2_power*
_output_shapes
:
k
"save/RestoreV2_31/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
Ў
save/RestoreV2_31	RestoreV2
save/Constsave/RestoreV2_31/tensor_names"save/RestoreV2_31/shape_and_slices*
dtypes
2*
_output_shapes
:
▒
save/Assign_31Assignlossss/beta2_powersave/RestoreV2_31*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
г
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_30^save/Assign_31
╬
Merge/MergeSummaryMergeSummaryLayer1ConV/conv1_w_smryLayer2ConV/conv2_w_smryLayer3FC1/fc1_W_smryLayer4FC2/fc2_W_smryLayer5FC/fc3_W_smryaccuracy/ScalarSummary*
N*
_output_shapes
: 
┤	
initNoOp^Layer1ConV/Variable/Assign^Layer1ConV/Variable_1/Assign^Layer2ConV/Variable/Assign^Layer2ConV/Variable_1/Assign^Layer3FC1/Variable/Assign^Layer3FC1/Variable_1/Assign^Layer4FC2/Variable/Assign^Layer4FC2/Variable_1/Assign^Layer5FC/Variable/Assign^Layer5FC/Variable_1/Assign^lossss/beta1_power/Assign^lossss/beta2_power/Assign'^lossss/Layer1ConV/Variable/Adam/Assign)^lossss/Layer1ConV/Variable/Adam_1/Assign)^lossss/Layer1ConV/Variable_1/Adam/Assign+^lossss/Layer1ConV/Variable_1/Adam_1/Assign'^lossss/Layer2ConV/Variable/Adam/Assign)^lossss/Layer2ConV/Variable/Adam_1/Assign)^lossss/Layer2ConV/Variable_1/Adam/Assign+^lossss/Layer2ConV/Variable_1/Adam_1/Assign&^lossss/Layer3FC1/Variable/Adam/Assign(^lossss/Layer3FC1/Variable/Adam_1/Assign(^lossss/Layer3FC1/Variable_1/Adam/Assign*^lossss/Layer3FC1/Variable_1/Adam_1/Assign&^lossss/Layer4FC2/Variable/Adam/Assign(^lossss/Layer4FC2/Variable/Adam_1/Assign(^lossss/Layer4FC2/Variable_1/Adam/Assign*^lossss/Layer4FC2/Variable_1/Adam_1/Assign%^lossss/Layer5FC/Variable/Adam/Assign'^lossss/Layer5FC/Variable/Adam_1/Assign'^lossss/Layer5FC/Variable_1/Adam/Assign)^lossss/Layer5FC/Variable_1/Adam_1/Assign
|
#Layer1ConV_1/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
g
"Layer1ConV_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
i
$Layer1ConV_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
╝
-Layer1ConV_1/truncated_normal/TruncatedNormalTruncatedNormal#Layer1ConV_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*&
_output_shapes
:
«
!Layer1ConV_1/truncated_normal/mulMul-Layer1ConV_1/truncated_normal/TruncatedNormal$Layer1ConV_1/truncated_normal/stddev*
T0*&
_output_shapes
:
ю
Layer1ConV_1/truncated_normalAdd!Layer1ConV_1/truncated_normal/mul"Layer1ConV_1/truncated_normal/mean*
T0*&
_output_shapes
:
Ќ
Layer1ConV_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
Я
Layer1ConV_1/Variable/AssignAssignLayer1ConV_1/VariableLayer1ConV_1/truncated_normal*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
ў
Layer1ConV_1/Variable/readIdentityLayer1ConV_1/Variable*
T0*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
w
Layer1ConV_1/conv1_w_smry/tagConst*
dtype0**
value!B BLayer1ConV_1/conv1_w_smry*
_output_shapes
: 
Ѕ
Layer1ConV_1/conv1_w_smryHistogramSummaryLayer1ConV_1/conv1_w_smry/tagLayer1ConV_1/Variable/read*
T0*
_output_shapes
: 
_
Layer1ConV_1/zerosConst*
dtype0*
valueB*    *
_output_shapes
:
Ђ
Layer1ConV_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
¤
Layer1ConV_1/Variable_1/AssignAssignLayer1ConV_1/Variable_1Layer1ConV_1/zeros*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
њ
Layer1ConV_1/Variable_1/readIdentityLayer1ConV_1/Variable_1*
T0**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
п
Layer1ConV_1/Conv2DConv2DPlaceholderLayer1ConV_1/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         *
T0*
paddingVALID*
strides

ё
Layer1ConV_1/addAddLayer1ConV_1/Conv2DLayer1ConV_1/Variable_1/read*
T0*/
_output_shapes
:         
e
Layer1ConV_1/ReluReluLayer1ConV_1/add*
T0*/
_output_shapes
:         
┐
Layer1ConV_1/MaxPoolMaxPoolLayer1ConV_1/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

|
#Layer2ConV_1/truncated_normal/shapeConst*
dtype0*%
valueB"            *
_output_shapes
:
g
"Layer2ConV_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
i
$Layer2ConV_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
╝
-Layer2ConV_1/truncated_normal/TruncatedNormalTruncatedNormal#Layer2ConV_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*&
_output_shapes
:
«
!Layer2ConV_1/truncated_normal/mulMul-Layer2ConV_1/truncated_normal/TruncatedNormal$Layer2ConV_1/truncated_normal/stddev*
T0*&
_output_shapes
:
ю
Layer2ConV_1/truncated_normalAdd!Layer2ConV_1/truncated_normal/mul"Layer2ConV_1/truncated_normal/mean*
T0*&
_output_shapes
:
Ќ
Layer2ConV_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:*&
_output_shapes
:
Я
Layer2ConV_1/Variable/AssignAssignLayer2ConV_1/VariableLayer2ConV_1/truncated_normal*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
ў
Layer2ConV_1/Variable/readIdentityLayer2ConV_1/Variable*
T0*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
w
Layer2ConV_1/conv2_w_smry/tagConst*
dtype0**
value!B BLayer2ConV_1/conv2_w_smry*
_output_shapes
: 
Ѕ
Layer2ConV_1/conv2_w_smryHistogramSummaryLayer2ConV_1/conv2_w_smry/tagLayer2ConV_1/Variable/read*
T0*
_output_shapes
: 
_
Layer2ConV_1/zerosConst*
dtype0*
valueB*    *
_output_shapes
:
Ђ
Layer2ConV_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:*
_output_shapes
:
¤
Layer2ConV_1/Variable_1/AssignAssignLayer2ConV_1/Variable_1Layer2ConV_1/zeros*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
њ
Layer2ConV_1/Variable_1/readIdentityLayer2ConV_1/Variable_1*
T0**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
р
Layer2ConV_1/Conv2DConv2DLayer1ConV_1/MaxPoolLayer2ConV_1/Variable/read*
data_formatNHWC*
use_cudnn_on_gpu(*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

ё
Layer2ConV_1/addAddLayer2ConV_1/Conv2DLayer2ConV_1/Variable_1/read*
T0*/
_output_shapes
:         


e
Layer2ConV_1/ReluReluLayer2ConV_1/add*
T0*/
_output_shapes
:         


┐
Layer2ConV_1/MaxPoolMaxPoolLayer2ConV_1/Relu*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

s
"Layer2ConV_1/Flatten/Reshape/shapeConst*
dtype0*
valueB"    љ  *
_output_shapes
:
б
Layer2ConV_1/Flatten/ReshapeReshapeLayer2ConV_1/MaxPool"Layer2ConV_1/Flatten/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:         љ
s
"Layer3FC1_1/truncated_normal/shapeConst*
dtype0*
valueB"љ  x   *
_output_shapes
:
f
!Layer3FC1_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
h
#Layer3FC1_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
│
,Layer3FC1_1/truncated_normal/TruncatedNormalTruncatedNormal"Layer3FC1_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes
:	љx
ц
 Layer3FC1_1/truncated_normal/mulMul,Layer3FC1_1/truncated_normal/TruncatedNormal#Layer3FC1_1/truncated_normal/stddev*
T0*
_output_shapes
:	љx
њ
Layer3FC1_1/truncated_normalAdd Layer3FC1_1/truncated_normal/mul!Layer3FC1_1/truncated_normal/mean*
T0*
_output_shapes
:	љx
ѕ
Layer3FC1_1/VariableVariable*
dtype0*
	container *
shared_name *
shape:	љx*
_output_shapes
:	љx
Н
Layer3FC1_1/Variable/AssignAssignLayer3FC1_1/VariableLayer3FC1_1/truncated_normal*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
ј
Layer3FC1_1/Variable/readIdentityLayer3FC1_1/Variable*
T0*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
q
Layer3FC1_1/fc1_W_smry/tagConst*
dtype0*'
valueB BLayer3FC1_1/fc1_W_smry*
_output_shapes
: 
ѓ
Layer3FC1_1/fc1_W_smryHistogramSummaryLayer3FC1_1/fc1_W_smry/tagLayer3FC1_1/Variable/read*
T0*
_output_shapes
: 
^
Layer3FC1_1/zerosConst*
dtype0*
valueBx*    *
_output_shapes
:x
ђ
Layer3FC1_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:x*
_output_shapes
:x
╦
Layer3FC1_1/Variable_1/AssignAssignLayer3FC1_1/Variable_1Layer3FC1_1/zeros*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
Ј
Layer3FC1_1/Variable_1/readIdentityLayer3FC1_1/Variable_1*
T0*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
Г
Layer3FC1_1/MatMulMatMulLayer2ConV_1/Flatten/ReshapeLayer3FC1_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         x
y
Layer3FC1_1/addAddLayer3FC1_1/MatMulLayer3FC1_1/Variable_1/read*
T0*'
_output_shapes
:         x
[
Layer3FC1_1/ReluReluLayer3FC1_1/add*
T0*'
_output_shapes
:         x
s
"Layer4FC2_1/truncated_normal/shapeConst*
dtype0*
valueB"x   T   *
_output_shapes
:
f
!Layer4FC2_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
h
#Layer4FC2_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
▓
,Layer4FC2_1/truncated_normal/TruncatedNormalTruncatedNormal"Layer4FC2_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes

:xT
Б
 Layer4FC2_1/truncated_normal/mulMul,Layer4FC2_1/truncated_normal/TruncatedNormal#Layer4FC2_1/truncated_normal/stddev*
T0*
_output_shapes

:xT
Љ
Layer4FC2_1/truncated_normalAdd Layer4FC2_1/truncated_normal/mul!Layer4FC2_1/truncated_normal/mean*
T0*
_output_shapes

:xT
є
Layer4FC2_1/VariableVariable*
dtype0*
	container *
shared_name *
shape
:xT*
_output_shapes

:xT
н
Layer4FC2_1/Variable/AssignAssignLayer4FC2_1/VariableLayer4FC2_1/truncated_normal*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
Ї
Layer4FC2_1/Variable/readIdentityLayer4FC2_1/Variable*
T0*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
q
Layer4FC2_1/fc2_W_smry/tagConst*
dtype0*'
valueB BLayer4FC2_1/fc2_W_smry*
_output_shapes
: 
ѓ
Layer4FC2_1/fc2_W_smryHistogramSummaryLayer4FC2_1/fc2_W_smry/tagLayer4FC2_1/Variable/read*
T0*
_output_shapes
: 
^
Layer4FC2_1/zerosConst*
dtype0*
valueBT*    *
_output_shapes
:T
ђ
Layer4FC2_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:T*
_output_shapes
:T
╦
Layer4FC2_1/Variable_1/AssignAssignLayer4FC2_1/Variable_1Layer4FC2_1/zeros*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
Ј
Layer4FC2_1/Variable_1/readIdentityLayer4FC2_1/Variable_1*
T0*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
А
Layer4FC2_1/MatMulMatMulLayer3FC1_1/ReluLayer4FC2_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         T
y
Layer4FC2_1/addAddLayer4FC2_1/MatMulLayer4FC2_1/Variable_1/read*
T0*'
_output_shapes
:         T
[
Layer4FC2_1/ReluReluLayer4FC2_1/add*
T0*'
_output_shapes
:         T
r
!Layer5FC_1/truncated_normal/shapeConst*
dtype0*
valueB"T   +   *
_output_shapes
:
e
 Layer5FC_1/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
g
"Layer5FC_1/truncated_normal/stddevConst*
dtype0*
valueB
 *═╠╠=*
_output_shapes
: 
░
+Layer5FC_1/truncated_normal/TruncatedNormalTruncatedNormal!Layer5FC_1/truncated_normal/shape*
seed2 *

seed *
dtype0*
T0*
_output_shapes

:T+
а
Layer5FC_1/truncated_normal/mulMul+Layer5FC_1/truncated_normal/TruncatedNormal"Layer5FC_1/truncated_normal/stddev*
T0*
_output_shapes

:T+
ј
Layer5FC_1/truncated_normalAddLayer5FC_1/truncated_normal/mul Layer5FC_1/truncated_normal/mean*
T0*
_output_shapes

:T+
Ё
Layer5FC_1/VariableVariable*
dtype0*
	container *
shared_name *
shape
:T+*
_output_shapes

:T+
л
Layer5FC_1/Variable/AssignAssignLayer5FC_1/VariableLayer5FC_1/truncated_normal*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
і
Layer5FC_1/Variable/readIdentityLayer5FC_1/Variable*
T0*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
o
Layer5FC_1/fc3_W_smry/tagConst*
dtype0*&
valueB BLayer5FC_1/fc3_W_smry*
_output_shapes
: 

Layer5FC_1/fc3_W_smryHistogramSummaryLayer5FC_1/fc3_W_smry/tagLayer5FC_1/Variable/read*
T0*
_output_shapes
: 
]
Layer5FC_1/zerosConst*
dtype0*
valueB+*    *
_output_shapes
:+

Layer5FC_1/Variable_1Variable*
dtype0*
	container *
shared_name *
shape:+*
_output_shapes
:+
К
Layer5FC_1/Variable_1/AssignAssignLayer5FC_1/Variable_1Layer5FC_1/zeros*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
ї
Layer5FC_1/Variable_1/readIdentityLayer5FC_1/Variable_1*
T0*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
Ъ
Layer5FC_1/MatMulMatMulLayer4FC2_1/ReluLayer5FC_1/Variable/read*
T0*
transpose_b( *
transpose_a( *'
_output_shapes
:         +
v
Layer5FC_1/addAddLayer5FC_1/MatMulLayer5FC_1/Variable_1/read*
T0*'
_output_shapes
:         +
O
lossss_1/RankConst*
dtype0*
value	B :*
_output_shapes
: 
\
lossss_1/ShapeShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
Q
lossss_1/Rank_1Const*
dtype0*
value	B :*
_output_shapes
: 
^
lossss_1/Shape_1ShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
P
lossss_1/Sub/yConst*
dtype0*
value	B :*
_output_shapes
: 
U
lossss_1/SubSublossss_1/Rank_1lossss_1/Sub/y*
T0*
_output_shapes
: 
d
lossss_1/Slice/beginPacklossss_1/Sub*
N*
T0*

axis *
_output_shapes
:
]
lossss_1/Slice/sizeConst*
dtype0*
valueB:*
_output_shapes
:
є
lossss_1/SliceSlicelossss_1/Shape_1lossss_1/Slice/beginlossss_1/Slice/size*
Index0*
T0*
_output_shapes
:
\
lossss_1/concat/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
k
lossss_1/concat/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ї
lossss_1/concatConcatlossss_1/concat/concat_dimlossss_1/concat/values_0lossss_1/Slice*
N*
T0*
_output_shapes
:
Ё
lossss_1/ReshapeReshapeLayer5FC_1/addlossss_1/concat*
T0*
Tshape0*0
_output_shapes
:                  
A
lossss_1/Rank_2Rankone_hot*
T0*
_output_shapes
: 
`
lossss_1/Shape_2Shapeone_hot*
T0*
out_type0*#
_output_shapes
:         
R
lossss_1/Sub_1/yConst*
dtype0*
value	B :*
_output_shapes
: 
Y
lossss_1/Sub_1Sublossss_1/Rank_2lossss_1/Sub_1/y*
T0*
_output_shapes
: 
h
lossss_1/Slice_1/beginPacklossss_1/Sub_1*
N*
T0*

axis *
_output_shapes
:
_
lossss_1/Slice_1/sizeConst*
dtype0*
valueB:*
_output_shapes
:
ї
lossss_1/Slice_1Slicelossss_1/Shape_2lossss_1/Slice_1/beginlossss_1/Slice_1/size*
Index0*
T0*
_output_shapes
:
^
lossss_1/concat_1/concat_dimConst*
dtype0*
value	B : *
_output_shapes
: 
m
lossss_1/concat_1/values_0Const*
dtype0*
valueB:
         *
_output_shapes
:
Ћ
lossss_1/concat_1Concatlossss_1/concat_1/concat_dimlossss_1/concat_1/values_0lossss_1/Slice_1*
N*
T0*
_output_shapes
:
ѓ
lossss_1/Reshape_1Reshapeone_hotlossss_1/concat_1*
T0*
Tshape0*0
_output_shapes
:                  
и
&lossss_1/SoftmaxCrossEntropyWithLogitsSoftmaxCrossEntropyWithLogitslossss_1/Reshapelossss_1/Reshape_1*
T0*?
_output_shapes-
+:         :                  
R
lossss_1/Sub_2/yConst*
dtype0*
value	B :*
_output_shapes
: 
W
lossss_1/Sub_2Sublossss_1/Ranklossss_1/Sub_2/y*
T0*
_output_shapes
: 
`
lossss_1/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
g
lossss_1/Slice_2/sizePacklossss_1/Sub_2*
N*
T0*

axis *
_output_shapes
:
Њ
lossss_1/Slice_2Slicelossss_1/Shapelossss_1/Slice_2/beginlossss_1/Slice_2/size*
Index0*
T0*#
_output_shapes
:         
Њ
lossss_1/Reshape_2Reshape&lossss_1/SoftmaxCrossEntropyWithLogitslossss_1/Slice_2*
T0*
Tshape0*#
_output_shapes
:         
X
lossss_1/ConstConst*
dtype0*
valueB: *
_output_shapes
:
w
lossss_1/MeanMeanlossss_1/Reshape_2lossss_1/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
_
lossss_1/loss/tagConst*
dtype0*
valueB Blossss_1/loss*
_output_shapes
: 
d
lossss_1/lossHistogramSummarylossss_1/loss/taglossss_1/Mean*
T0*
_output_shapes
: 
[
lossss_1/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
]
lossss_1/gradients/ConstConst*
dtype0*
valueB
 *  ђ?*
_output_shapes
: 
t
lossss_1/gradients/FillFilllossss_1/gradients/Shapelossss_1/gradients/Const*
T0*
_output_shapes
: 
}
3lossss_1/gradients/lossss_1/Mean_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:
╣
-lossss_1/gradients/lossss_1/Mean_grad/ReshapeReshapelossss_1/gradients/Fill3lossss_1/gradients/lossss_1/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
}
+lossss_1/gradients/lossss_1/Mean_grad/ShapeShapelossss_1/Reshape_2*
T0*
out_type0*
_output_shapes
:
╬
*lossss_1/gradients/lossss_1/Mean_grad/TileTile-lossss_1/gradients/lossss_1/Mean_grad/Reshape+lossss_1/gradients/lossss_1/Mean_grad/Shape*

Tmultiples0*
T0*#
_output_shapes
:         

-lossss_1/gradients/lossss_1/Mean_grad/Shape_1Shapelossss_1/Reshape_2*
T0*
out_type0*
_output_shapes
:
p
-lossss_1/gradients/lossss_1/Mean_grad/Shape_2Const*
dtype0*
valueB *
_output_shapes
: 
u
+lossss_1/gradients/lossss_1/Mean_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
╠
*lossss_1/gradients/lossss_1/Mean_grad/ProdProd-lossss_1/gradients/lossss_1/Mean_grad/Shape_1+lossss_1/gradients/lossss_1/Mean_grad/Const*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
w
-lossss_1/gradients/lossss_1/Mean_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
л
,lossss_1/gradients/lossss_1/Mean_grad/Prod_1Prod-lossss_1/gradients/lossss_1/Mean_grad/Shape_2-lossss_1/gradients/lossss_1/Mean_grad/Const_1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
: 
q
/lossss_1/gradients/lossss_1/Mean_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 
И
-lossss_1/gradients/lossss_1/Mean_grad/MaximumMaximum,lossss_1/gradients/lossss_1/Mean_grad/Prod_1/lossss_1/gradients/lossss_1/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
▒
.lossss_1/gradients/lossss_1/Mean_grad/floordivDiv*lossss_1/gradients/lossss_1/Mean_grad/Prod-lossss_1/gradients/lossss_1/Mean_grad/Maximum*
T0*
_output_shapes
: 
њ
*lossss_1/gradients/lossss_1/Mean_grad/CastCast.lossss_1/gradients/lossss_1/Mean_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 
║
-lossss_1/gradients/lossss_1/Mean_grad/truedivDiv*lossss_1/gradients/lossss_1/Mean_grad/Tile*lossss_1/gradients/lossss_1/Mean_grad/Cast*
T0*#
_output_shapes
:         
ќ
0lossss_1/gradients/lossss_1/Reshape_2_grad/ShapeShape&lossss_1/SoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:
┌
2lossss_1/gradients/lossss_1/Reshape_2_grad/ReshapeReshape-lossss_1/gradients/lossss_1/Mean_grad/truediv0lossss_1/gradients/lossss_1/Reshape_2_grad/Shape*
T0*
Tshape0*#
_output_shapes
:         
Ј
lossss_1/gradients/zeros_like	ZerosLike(lossss_1/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
ў
Mlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
dtype0*
valueB :
         *
_output_shapes
: 
ў
Ilossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims2lossss_1/gradients/lossss_1/Reshape_2_grad/ReshapeMlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*

Tdim0*'
_output_shapes
:         
щ
Blossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/mulMulIlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/ExpandDims(lossss_1/SoftmaxCrossEntropyWithLogits:1*
T0*0
_output_shapes
:                  
|
.lossss_1/gradients/lossss_1/Reshape_grad/ShapeShapeLayer5FC_1/add*
T0*
out_type0*
_output_shapes
:
№
0lossss_1/gradients/lossss_1/Reshape_grad/ReshapeReshapeBlossss_1/gradients/lossss_1/SoftmaxCrossEntropyWithLogits_grad/mul.lossss_1/gradients/lossss_1/Reshape_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         +
}
,lossss_1/gradients/Layer5FC_1/add_grad/ShapeShapeLayer5FC_1/MatMul*
T0*
out_type0*
_output_shapes
:
x
.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1Const*
dtype0*
valueB:+*
_output_shapes
:
­
<lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs,lossss_1/gradients/Layer5FC_1/add_grad/Shape.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
р
*lossss_1/gradients/Layer5FC_1/add_grad/SumSum0lossss_1/gradients/lossss_1/Reshape_grad/Reshape<lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
М
.lossss_1/gradients/Layer5FC_1/add_grad/ReshapeReshape*lossss_1/gradients/Layer5FC_1/add_grad/Sum,lossss_1/gradients/Layer5FC_1/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         +
т
,lossss_1/gradients/Layer5FC_1/add_grad/Sum_1Sum0lossss_1/gradients/lossss_1/Reshape_grad/Reshape>lossss_1/gradients/Layer5FC_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
╠
0lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1Reshape,lossss_1/gradients/Layer5FC_1/add_grad/Sum_1.lossss_1/gradients/Layer5FC_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:+
Б
7lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_depsNoOp/^lossss_1/gradients/Layer5FC_1/add_grad/Reshape1^lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1
ф
?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependencyIdentity.lossss_1/gradients/Layer5FC_1/add_grad/Reshape8^lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_deps*
T0*A
_class7
53loc:@lossss_1/gradients/Layer5FC_1/add_grad/Reshape*'
_output_shapes
:         +
Б
Alossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency_1Identity0lossss_1/gradients/Layer5FC_1/add_grad/Reshape_18^lossss_1/gradients/Layer5FC_1/add_grad/tuple/group_deps*
T0*C
_class9
75loc:@lossss_1/gradients/Layer5FC_1/add_grad/Reshape_1*
_output_shapes
:+
ь
0lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMulMatMul?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependencyLayer5FC_1/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         T
я
2lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1MatMulLayer4FC2_1/Relu?lossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:T+
ф
:lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul3^lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1
┤
Blossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul;^lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul*'
_output_shapes
:         T
▒
Dlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1;^lossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@lossss_1/gradients/Layer5FC_1/MatMul_grad/MatMul_1*
_output_shapes

:T+
┼
1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGradReluGradBlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependencyLayer4FC2_1/Relu*
T0*'
_output_shapes
:         T

-lossss_1/gradients/Layer4FC2_1/add_grad/ShapeShapeLayer4FC2_1/MatMul*
T0*
out_type0*
_output_shapes
:
y
/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1Const*
dtype0*
valueB:T*
_output_shapes
:
з
=lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs-lossss_1/gradients/Layer4FC2_1/add_grad/Shape/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
С
+lossss_1/gradients/Layer4FC2_1/add_grad/SumSum1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGrad=lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
о
/lossss_1/gradients/Layer4FC2_1/add_grad/ReshapeReshape+lossss_1/gradients/Layer4FC2_1/add_grad/Sum-lossss_1/gradients/Layer4FC2_1/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         T
У
-lossss_1/gradients/Layer4FC2_1/add_grad/Sum_1Sum1lossss_1/gradients/Layer4FC2_1/Relu_grad/ReluGrad?lossss_1/gradients/Layer4FC2_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
¤
1lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1Reshape-lossss_1/gradients/Layer4FC2_1/add_grad/Sum_1/lossss_1/gradients/Layer4FC2_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:T
д
8lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_depsNoOp0^lossss_1/gradients/Layer4FC2_1/add_grad/Reshape2^lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1
«
@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependencyIdentity/lossss_1/gradients/Layer4FC2_1/add_grad/Reshape9^lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_deps*
T0*B
_class8
64loc:@lossss_1/gradients/Layer4FC2_1/add_grad/Reshape*'
_output_shapes
:         T
Д
Blossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency_1Identity1lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_19^lossss_1/gradients/Layer4FC2_1/add_grad/tuple/group_deps*
T0*D
_class:
86loc:@lossss_1/gradients/Layer4FC2_1/add_grad/Reshape_1*
_output_shapes
:T
­
1lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMulMatMul@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependencyLayer4FC2_1/Variable/read*
T0*
transpose_b(*
transpose_a( *'
_output_shapes
:         x
Я
3lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1MatMulLayer3FC1_1/Relu@lossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes

:xT
Г
;lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_depsNoOp2^lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul4^lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1
И
Clossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependencyIdentity1lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul<^lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_deps*
T0*D
_class:
86loc:@lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul*'
_output_shapes
:         x
х
Elossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependency_1Identity3lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1<^lossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/group_deps*
T0*F
_class<
:8loc:@lossss_1/gradients/Layer4FC2_1/MatMul_grad/MatMul_1*
_output_shapes

:xT
к
1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGradReluGradClossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependencyLayer3FC1_1/Relu*
T0*'
_output_shapes
:         x

-lossss_1/gradients/Layer3FC1_1/add_grad/ShapeShapeLayer3FC1_1/MatMul*
T0*
out_type0*
_output_shapes
:
y
/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1Const*
dtype0*
valueB:x*
_output_shapes
:
з
=lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs-lossss_1/gradients/Layer3FC1_1/add_grad/Shape/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
С
+lossss_1/gradients/Layer3FC1_1/add_grad/SumSum1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGrad=lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
о
/lossss_1/gradients/Layer3FC1_1/add_grad/ReshapeReshape+lossss_1/gradients/Layer3FC1_1/add_grad/Sum-lossss_1/gradients/Layer3FC1_1/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:         x
У
-lossss_1/gradients/Layer3FC1_1/add_grad/Sum_1Sum1lossss_1/gradients/Layer3FC1_1/Relu_grad/ReluGrad?lossss_1/gradients/Layer3FC1_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
¤
1lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1Reshape-lossss_1/gradients/Layer3FC1_1/add_grad/Sum_1/lossss_1/gradients/Layer3FC1_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:x
д
8lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_depsNoOp0^lossss_1/gradients/Layer3FC1_1/add_grad/Reshape2^lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1
«
@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependencyIdentity/lossss_1/gradients/Layer3FC1_1/add_grad/Reshape9^lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_deps*
T0*B
_class8
64loc:@lossss_1/gradients/Layer3FC1_1/add_grad/Reshape*'
_output_shapes
:         x
Д
Blossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency_1Identity1lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_19^lossss_1/gradients/Layer3FC1_1/add_grad/tuple/group_deps*
T0*D
_class:
86loc:@lossss_1/gradients/Layer3FC1_1/add_grad/Reshape_1*
_output_shapes
:x
ы
1lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMulMatMul@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependencyLayer3FC1_1/Variable/read*
T0*
transpose_b(*
transpose_a( *(
_output_shapes
:         љ
ь
3lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1MatMulLayer2ConV_1/Flatten/Reshape@lossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(*
_output_shapes
:	љx
Г
;lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_depsNoOp2^lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul4^lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1
╣
Clossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependencyIdentity1lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul<^lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_deps*
T0*D
_class:
86loc:@lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul*(
_output_shapes
:         љ
Х
Elossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency_1Identity3lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1<^lossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/group_deps*
T0*F
_class<
:8loc:@lossss_1/gradients/Layer3FC1_1/MatMul_grad/MatMul_1*
_output_shapes
:	љx
ј
:lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/ShapeShapeLayer2ConV_1/MaxPool*
T0*
out_type0*
_output_shapes
:
љ
<lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/ReshapeReshapeClossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency:lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         
╗
8lossss_1/gradients/Layer2ConV_1/MaxPool_grad/MaxPoolGradMaxPoolGradLayer2ConV_1/ReluLayer2ConV_1/MaxPool<lossss_1/gradients/Layer2ConV_1/Flatten/Reshape_grad/Reshape*
ksize
*
data_formatNHWC*/
_output_shapes
:         

*
T0*
paddingVALID*
strides

┼
2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGradReluGrad8lossss_1/gradients/Layer2ConV_1/MaxPool_grad/MaxPoolGradLayer2ConV_1/Relu*
T0*/
_output_shapes
:         


Ђ
.lossss_1/gradients/Layer2ConV_1/add_grad/ShapeShapeLayer2ConV_1/Conv2D*
T0*
out_type0*
_output_shapes
:
z
0lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ш
>lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs.lossss_1/gradients/Layer2ConV_1/add_grad/Shape0lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
у
,lossss_1/gradients/Layer2ConV_1/add_grad/SumSum2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGrad>lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
р
0lossss_1/gradients/Layer2ConV_1/add_grad/ReshapeReshape,lossss_1/gradients/Layer2ConV_1/add_grad/Sum.lossss_1/gradients/Layer2ConV_1/add_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         


в
.lossss_1/gradients/Layer2ConV_1/add_grad/Sum_1Sum2lossss_1/gradients/Layer2ConV_1/Relu_grad/ReluGrad@lossss_1/gradients/Layer2ConV_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
м
2lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1Reshape.lossss_1/gradients/Layer2ConV_1/add_grad/Sum_10lossss_1/gradients/Layer2ConV_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Е
9lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer2ConV_1/add_grad/Reshape3^lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1
║
Alossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer2ConV_1/add_grad/Reshape:^lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_deps*
T0*C
_class9
75loc:@lossss_1/gradients/Layer2ConV_1/add_grad/Reshape*/
_output_shapes
:         


Ф
Clossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1:^lossss_1/gradients/Layer2ConV_1/add_grad/tuple/group_deps*
T0*E
_class;
97loc:@lossss_1/gradients/Layer2ConV_1/add_grad/Reshape_1*
_output_shapes
:
Ё
1lossss_1/gradients/Layer2ConV_1/Conv2D_grad/ShapeShapeLayer1ConV_1/MaxPool*
T0*
out_type0*
_output_shapes
:
Ћ
?lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput1lossss_1/gradients/Layer2ConV_1/Conv2D_grad/ShapeLayer2ConV_1/Variable/readAlossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ї
3lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
№
@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterLayer1ConV_1/MaxPool3lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Shape_1Alossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

╔
<lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_depsNoOp@^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInputA^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter
я
Dlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependencyIdentity?lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInput=^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_deps*
T0*R
_classH
FDloc:@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:         
┘
Flossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency_1Identity@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter=^lossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/group_deps*
T0*S
_classI
GEloc:@lossss_1/gradients/Layer2ConV_1/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
:
├
8lossss_1/gradients/Layer1ConV_1/MaxPool_grad/MaxPoolGradMaxPoolGradLayer1ConV_1/ReluLayer1ConV_1/MaxPoolDlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency*
ksize
*
data_formatNHWC*/
_output_shapes
:         *
T0*
paddingVALID*
strides

┼
2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGradReluGrad8lossss_1/gradients/Layer1ConV_1/MaxPool_grad/MaxPoolGradLayer1ConV_1/Relu*
T0*/
_output_shapes
:         
Ђ
.lossss_1/gradients/Layer1ConV_1/add_grad/ShapeShapeLayer1ConV_1/Conv2D*
T0*
out_type0*
_output_shapes
:
z
0lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
Ш
>lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs.lossss_1/gradients/Layer1ConV_1/add_grad/Shape0lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1*
T0*2
_output_shapes 
:         :         
у
,lossss_1/gradients/Layer1ConV_1/add_grad/SumSum2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGrad>lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgs*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
р
0lossss_1/gradients/Layer1ConV_1/add_grad/ReshapeReshape,lossss_1/gradients/Layer1ConV_1/add_grad/Sum.lossss_1/gradients/Layer1ConV_1/add_grad/Shape*
T0*
Tshape0*/
_output_shapes
:         
в
.lossss_1/gradients/Layer1ConV_1/add_grad/Sum_1Sum2lossss_1/gradients/Layer1ConV_1/Relu_grad/ReluGrad@lossss_1/gradients/Layer1ConV_1/add_grad/BroadcastGradientArgs:1*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
м
2lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1Reshape.lossss_1/gradients/Layer1ConV_1/add_grad/Sum_10lossss_1/gradients/Layer1ConV_1/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Е
9lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_depsNoOp1^lossss_1/gradients/Layer1ConV_1/add_grad/Reshape3^lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1
║
Alossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependencyIdentity0lossss_1/gradients/Layer1ConV_1/add_grad/Reshape:^lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_deps*
T0*C
_class9
75loc:@lossss_1/gradients/Layer1ConV_1/add_grad/Reshape*/
_output_shapes
:         
Ф
Clossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency_1Identity2lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1:^lossss_1/gradients/Layer1ConV_1/add_grad/tuple/group_deps*
T0*E
_class;
97loc:@lossss_1/gradients/Layer1ConV_1/add_grad/Reshape_1*
_output_shapes
:
|
1lossss_1/gradients/Layer1ConV_1/Conv2D_grad/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:
Ћ
?lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput1lossss_1/gradients/Layer1ConV_1/Conv2D_grad/ShapeLayer1ConV_1/Variable/readAlossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*J
_output_shapes8
6:4                                    *
T0*
paddingVALID*
strides

ї
3lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Shape_1Const*
dtype0*%
valueB"            *
_output_shapes
:
Т
@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterPlaceholder3lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Shape_1Alossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency*
data_formatNHWC*
use_cudnn_on_gpu(*&
_output_shapes
:*
T0*
paddingVALID*
strides

╔
<lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_depsNoOp@^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInputA^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter
я
Dlossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependencyIdentity?lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInput=^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_deps*
T0*R
_classH
FDloc:@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:           
┘
Flossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependency_1Identity@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter=^lossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/group_deps*
T0*S
_classI
GEloc:@lossss_1/gradients/Layer1ConV_1/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
:
Љ
"lossss_1/beta1_power/initial_valueConst*
dtype0*
valueB
 *fff?*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
а
lossss_1/beta1_powerVariable*
dtype0*
shape: *(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *
_output_shapes
: 
М
lossss_1/beta1_power/AssignAssignlossss_1/beta1_power"lossss_1/beta1_power/initial_value*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
є
lossss_1/beta1_power/readIdentitylossss_1/beta1_power*
T0*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
Љ
"lossss_1/beta2_power/initial_valueConst*
dtype0*
valueB
 *wЙ?*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
а
lossss_1/beta2_powerVariable*
dtype0*
shape: *(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *
_output_shapes
: 
М
lossss_1/beta2_power/AssignAssignlossss_1/beta2_power"lossss_1/beta2_power/initial_value*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
є
lossss_1/beta2_power/readIdentitylossss_1/beta2_power*
T0*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
s
lossss_1/zerosConst*
dtype0*%
valueB*    *&
_output_shapes
:
¤
#lossss_1/Layer1ConV_1/Variable/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
ь
*lossss_1/Layer1ConV_1/Variable/Adam/AssignAssign#lossss_1/Layer1ConV_1/Variable/Adamlossss_1/zeros*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
┤
(lossss_1/Layer1ConV_1/Variable/Adam/readIdentity#lossss_1/Layer1ConV_1/Variable/Adam*
T0*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
u
lossss_1/zeros_1Const*
dtype0*%
valueB*    *&
_output_shapes
:
Л
%lossss_1/Layer1ConV_1/Variable/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer1ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
з
,lossss_1/Layer1ConV_1/Variable/Adam_1/AssignAssign%lossss_1/Layer1ConV_1/Variable/Adam_1lossss_1/zeros_1*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
И
*lossss_1/Layer1ConV_1/Variable/Adam_1/readIdentity%lossss_1/Layer1ConV_1/Variable/Adam_1*
T0*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
]
lossss_1/zeros_2Const*
dtype0*
valueB*    *
_output_shapes
:
╗
%lossss_1/Layer1ConV_1/Variable_1/AdamVariable*
dtype0*
shape:**
_class 
loc:@Layer1ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ж
,lossss_1/Layer1ConV_1/Variable_1/Adam/AssignAssign%lossss_1/Layer1ConV_1/Variable_1/Adamlossss_1/zeros_2*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
«
*lossss_1/Layer1ConV_1/Variable_1/Adam/readIdentity%lossss_1/Layer1ConV_1/Variable_1/Adam*
T0**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
]
lossss_1/zeros_3Const*
dtype0*
valueB*    *
_output_shapes
:
й
'lossss_1/Layer1ConV_1/Variable_1/Adam_1Variable*
dtype0*
shape:**
_class 
loc:@Layer1ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ь
.lossss_1/Layer1ConV_1/Variable_1/Adam_1/AssignAssign'lossss_1/Layer1ConV_1/Variable_1/Adam_1lossss_1/zeros_3*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
▓
,lossss_1/Layer1ConV_1/Variable_1/Adam_1/readIdentity'lossss_1/Layer1ConV_1/Variable_1/Adam_1*
T0**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
u
lossss_1/zeros_4Const*
dtype0*%
valueB*    *&
_output_shapes
:
¤
#lossss_1/Layer2ConV_1/Variable/AdamVariable*
dtype0*
shape:*(
_class
loc:@Layer2ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
№
*lossss_1/Layer2ConV_1/Variable/Adam/AssignAssign#lossss_1/Layer2ConV_1/Variable/Adamlossss_1/zeros_4*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
┤
(lossss_1/Layer2ConV_1/Variable/Adam/readIdentity#lossss_1/Layer2ConV_1/Variable/Adam*
T0*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
u
lossss_1/zeros_5Const*
dtype0*%
valueB*    *&
_output_shapes
:
Л
%lossss_1/Layer2ConV_1/Variable/Adam_1Variable*
dtype0*
shape:*(
_class
loc:@Layer2ConV_1/Variable*
shared_name *
	container *&
_output_shapes
:
з
,lossss_1/Layer2ConV_1/Variable/Adam_1/AssignAssign%lossss_1/Layer2ConV_1/Variable/Adam_1lossss_1/zeros_5*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
И
*lossss_1/Layer2ConV_1/Variable/Adam_1/readIdentity%lossss_1/Layer2ConV_1/Variable/Adam_1*
T0*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
]
lossss_1/zeros_6Const*
dtype0*
valueB*    *
_output_shapes
:
╗
%lossss_1/Layer2ConV_1/Variable_1/AdamVariable*
dtype0*
shape:**
_class 
loc:@Layer2ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ж
,lossss_1/Layer2ConV_1/Variable_1/Adam/AssignAssign%lossss_1/Layer2ConV_1/Variable_1/Adamlossss_1/zeros_6*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
«
*lossss_1/Layer2ConV_1/Variable_1/Adam/readIdentity%lossss_1/Layer2ConV_1/Variable_1/Adam*
T0**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
]
lossss_1/zeros_7Const*
dtype0*
valueB*    *
_output_shapes
:
й
'lossss_1/Layer2ConV_1/Variable_1/Adam_1Variable*
dtype0*
shape:**
_class 
loc:@Layer2ConV_1/Variable_1*
shared_name *
	container *
_output_shapes
:
ь
.lossss_1/Layer2ConV_1/Variable_1/Adam_1/AssignAssign'lossss_1/Layer2ConV_1/Variable_1/Adam_1lossss_1/zeros_7*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
▓
,lossss_1/Layer2ConV_1/Variable_1/Adam_1/readIdentity'lossss_1/Layer2ConV_1/Variable_1/Adam_1*
T0**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
g
lossss_1/zeros_8Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
┐
"lossss_1/Layer3FC1_1/Variable/AdamVariable*
dtype0*
shape:	љx*'
_class
loc:@Layer3FC1_1/Variable*
shared_name *
	container *
_output_shapes
:	љx
т
)lossss_1/Layer3FC1_1/Variable/Adam/AssignAssign"lossss_1/Layer3FC1_1/Variable/Adamlossss_1/zeros_8*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
ф
'lossss_1/Layer3FC1_1/Variable/Adam/readIdentity"lossss_1/Layer3FC1_1/Variable/Adam*
T0*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
g
lossss_1/zeros_9Const*
dtype0*
valueB	љx*    *
_output_shapes
:	љx
┴
$lossss_1/Layer3FC1_1/Variable/Adam_1Variable*
dtype0*
shape:	љx*'
_class
loc:@Layer3FC1_1/Variable*
shared_name *
	container *
_output_shapes
:	љx
ж
+lossss_1/Layer3FC1_1/Variable/Adam_1/AssignAssign$lossss_1/Layer3FC1_1/Variable/Adam_1lossss_1/zeros_9*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
«
)lossss_1/Layer3FC1_1/Variable/Adam_1/readIdentity$lossss_1/Layer3FC1_1/Variable/Adam_1*
T0*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
^
lossss_1/zeros_10Const*
dtype0*
valueBx*    *
_output_shapes
:x
╣
$lossss_1/Layer3FC1_1/Variable_1/AdamVariable*
dtype0*
shape:x*)
_class
loc:@Layer3FC1_1/Variable_1*
shared_name *
	container *
_output_shapes
:x
у
+lossss_1/Layer3FC1_1/Variable_1/Adam/AssignAssign$lossss_1/Layer3FC1_1/Variable_1/Adamlossss_1/zeros_10*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
Ф
)lossss_1/Layer3FC1_1/Variable_1/Adam/readIdentity$lossss_1/Layer3FC1_1/Variable_1/Adam*
T0*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
^
lossss_1/zeros_11Const*
dtype0*
valueBx*    *
_output_shapes
:x
╗
&lossss_1/Layer3FC1_1/Variable_1/Adam_1Variable*
dtype0*
shape:x*)
_class
loc:@Layer3FC1_1/Variable_1*
shared_name *
	container *
_output_shapes
:x
в
-lossss_1/Layer3FC1_1/Variable_1/Adam_1/AssignAssign&lossss_1/Layer3FC1_1/Variable_1/Adam_1lossss_1/zeros_11*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
»
+lossss_1/Layer3FC1_1/Variable_1/Adam_1/readIdentity&lossss_1/Layer3FC1_1/Variable_1/Adam_1*
T0*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
f
lossss_1/zeros_12Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
й
"lossss_1/Layer4FC2_1/Variable/AdamVariable*
dtype0*
shape
:xT*'
_class
loc:@Layer4FC2_1/Variable*
shared_name *
	container *
_output_shapes

:xT
т
)lossss_1/Layer4FC2_1/Variable/Adam/AssignAssign"lossss_1/Layer4FC2_1/Variable/Adamlossss_1/zeros_12*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
Е
'lossss_1/Layer4FC2_1/Variable/Adam/readIdentity"lossss_1/Layer4FC2_1/Variable/Adam*
T0*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
f
lossss_1/zeros_13Const*
dtype0*
valueBxT*    *
_output_shapes

:xT
┐
$lossss_1/Layer4FC2_1/Variable/Adam_1Variable*
dtype0*
shape
:xT*'
_class
loc:@Layer4FC2_1/Variable*
shared_name *
	container *
_output_shapes

:xT
ж
+lossss_1/Layer4FC2_1/Variable/Adam_1/AssignAssign$lossss_1/Layer4FC2_1/Variable/Adam_1lossss_1/zeros_13*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
Г
)lossss_1/Layer4FC2_1/Variable/Adam_1/readIdentity$lossss_1/Layer4FC2_1/Variable/Adam_1*
T0*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
^
lossss_1/zeros_14Const*
dtype0*
valueBT*    *
_output_shapes
:T
╣
$lossss_1/Layer4FC2_1/Variable_1/AdamVariable*
dtype0*
shape:T*)
_class
loc:@Layer4FC2_1/Variable_1*
shared_name *
	container *
_output_shapes
:T
у
+lossss_1/Layer4FC2_1/Variable_1/Adam/AssignAssign$lossss_1/Layer4FC2_1/Variable_1/Adamlossss_1/zeros_14*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
Ф
)lossss_1/Layer4FC2_1/Variable_1/Adam/readIdentity$lossss_1/Layer4FC2_1/Variable_1/Adam*
T0*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
^
lossss_1/zeros_15Const*
dtype0*
valueBT*    *
_output_shapes
:T
╗
&lossss_1/Layer4FC2_1/Variable_1/Adam_1Variable*
dtype0*
shape:T*)
_class
loc:@Layer4FC2_1/Variable_1*
shared_name *
	container *
_output_shapes
:T
в
-lossss_1/Layer4FC2_1/Variable_1/Adam_1/AssignAssign&lossss_1/Layer4FC2_1/Variable_1/Adam_1lossss_1/zeros_15*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
»
+lossss_1/Layer4FC2_1/Variable_1/Adam_1/readIdentity&lossss_1/Layer4FC2_1/Variable_1/Adam_1*
T0*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
f
lossss_1/zeros_16Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
╗
!lossss_1/Layer5FC_1/Variable/AdamVariable*
dtype0*
shape
:T+*&
_class
loc:@Layer5FC_1/Variable*
shared_name *
	container *
_output_shapes

:T+
Р
(lossss_1/Layer5FC_1/Variable/Adam/AssignAssign!lossss_1/Layer5FC_1/Variable/Adamlossss_1/zeros_16*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
д
&lossss_1/Layer5FC_1/Variable/Adam/readIdentity!lossss_1/Layer5FC_1/Variable/Adam*
T0*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
f
lossss_1/zeros_17Const*
dtype0*
valueBT+*    *
_output_shapes

:T+
й
#lossss_1/Layer5FC_1/Variable/Adam_1Variable*
dtype0*
shape
:T+*&
_class
loc:@Layer5FC_1/Variable*
shared_name *
	container *
_output_shapes

:T+
Т
*lossss_1/Layer5FC_1/Variable/Adam_1/AssignAssign#lossss_1/Layer5FC_1/Variable/Adam_1lossss_1/zeros_17*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
ф
(lossss_1/Layer5FC_1/Variable/Adam_1/readIdentity#lossss_1/Layer5FC_1/Variable/Adam_1*
T0*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
^
lossss_1/zeros_18Const*
dtype0*
valueB+*    *
_output_shapes
:+
и
#lossss_1/Layer5FC_1/Variable_1/AdamVariable*
dtype0*
shape:+*(
_class
loc:@Layer5FC_1/Variable_1*
shared_name *
	container *
_output_shapes
:+
С
*lossss_1/Layer5FC_1/Variable_1/Adam/AssignAssign#lossss_1/Layer5FC_1/Variable_1/Adamlossss_1/zeros_18*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
е
(lossss_1/Layer5FC_1/Variable_1/Adam/readIdentity#lossss_1/Layer5FC_1/Variable_1/Adam*
T0*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
^
lossss_1/zeros_19Const*
dtype0*
valueB+*    *
_output_shapes
:+
╣
%lossss_1/Layer5FC_1/Variable_1/Adam_1Variable*
dtype0*
shape:+*(
_class
loc:@Layer5FC_1/Variable_1*
shared_name *
	container *
_output_shapes
:+
У
,lossss_1/Layer5FC_1/Variable_1/Adam_1/AssignAssign%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/zeros_19*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
г
*lossss_1/Layer5FC_1/Variable_1/Adam_1/readIdentity%lossss_1/Layer5FC_1/Variable_1/Adam_1*
T0*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
`
lossss_1/Adam/learning_rateConst*
dtype0*
valueB
 *oЃ:*
_output_shapes
: 
X
lossss_1/Adam/beta1Const*
dtype0*
valueB
 *fff?*
_output_shapes
: 
X
lossss_1/Adam/beta2Const*
dtype0*
valueB
 *wЙ?*
_output_shapes
: 
Z
lossss_1/Adam/epsilonConst*
dtype0*
valueB
 *w╠+2*
_output_shapes
: 
Ь
4lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam	ApplyAdamLayer1ConV_1/Variable#lossss_1/Layer1ConV_1/Variable/Adam%lossss_1/Layer1ConV_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonFlossss_1/gradients/Layer1ConV_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
ж
6lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam	ApplyAdamLayer1ConV_1/Variable_1%lossss_1/Layer1ConV_1/Variable_1/Adam'lossss_1/Layer1ConV_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonClossss_1/gradients/Layer1ConV_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
Ь
4lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam	ApplyAdamLayer2ConV_1/Variable#lossss_1/Layer2ConV_1/Variable/Adam%lossss_1/Layer2ConV_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonFlossss_1/gradients/Layer2ConV_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
ж
6lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam	ApplyAdamLayer2ConV_1/Variable_1%lossss_1/Layer2ConV_1/Variable_1/Adam'lossss_1/Layer2ConV_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonClossss_1/gradients/Layer2ConV_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
р
3lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam	ApplyAdamLayer3FC1_1/Variable"lossss_1/Layer3FC1_1/Variable/Adam$lossss_1/Layer3FC1_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonElossss_1/gradients/Layer3FC1_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
с
5lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam	ApplyAdamLayer3FC1_1/Variable_1$lossss_1/Layer3FC1_1/Variable_1/Adam&lossss_1/Layer3FC1_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonBlossss_1/gradients/Layer3FC1_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
Я
3lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam	ApplyAdamLayer4FC2_1/Variable"lossss_1/Layer4FC2_1/Variable/Adam$lossss_1/Layer4FC2_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonElossss_1/gradients/Layer4FC2_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
с
5lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam	ApplyAdamLayer4FC2_1/Variable_1$lossss_1/Layer4FC2_1/Variable_1/Adam&lossss_1/Layer4FC2_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonBlossss_1/gradients/Layer4FC2_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
┌
2lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam	ApplyAdamLayer5FC_1/Variable!lossss_1/Layer5FC_1/Variable/Adam#lossss_1/Layer5FC_1/Variable/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonDlossss_1/gradients/Layer5FC_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
П
4lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam	ApplyAdamLayer5FC_1/Variable_1#lossss_1/Layer5FC_1/Variable_1/Adam%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/beta1_power/readlossss_1/beta2_power/readlossss_1/Adam/learning_ratelossss_1/Adam/beta1lossss_1/Adam/beta2lossss_1/Adam/epsilonAlossss_1/gradients/Layer5FC_1/add_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
╗
lossss_1/Adam/mulMullossss_1/beta1_power/readlossss_1/Adam/beta15^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam*
T0*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
╗
lossss_1/Adam/AssignAssignlossss_1/beta1_powerlossss_1/Adam/mul*
use_locking( *
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
й
lossss_1/Adam/mul_1Mullossss_1/beta2_power/readlossss_1/Adam/beta25^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam*
T0*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
┐
lossss_1/Adam/Assign_1Assignlossss_1/beta2_powerlossss_1/Adam/mul_1*
use_locking( *
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
ь
lossss_1/AdamNoOp5^lossss_1/Adam/update_Layer1ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer1ConV_1/Variable_1/ApplyAdam5^lossss_1/Adam/update_Layer2ConV_1/Variable/ApplyAdam7^lossss_1/Adam/update_Layer2ConV_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer3FC1_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer3FC1_1/Variable_1/ApplyAdam4^lossss_1/Adam/update_Layer4FC2_1/Variable/ApplyAdam6^lossss_1/Adam/update_Layer4FC2_1/Variable_1/ApplyAdam3^lossss_1/Adam/update_Layer5FC_1/Variable/ApplyAdam5^lossss_1/Adam/update_Layer5FC_1/Variable_1/ApplyAdam^lossss_1/Adam/Assign^lossss_1/Adam/Assign_1
\
accuracyy/ArgMax/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
ђ
accuracyy/ArgMaxArgMaxLayer5FC_1/addaccuracyy/ArgMax/dimension*
T0*

Tidx0*#
_output_shapes
:         
^
accuracyy/ArgMax_1/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
r
accuracyy/ArgMax_1ArgMaxone_hotaccuracyy/ArgMax_1/dimension*
T0*

Tidx0*
_output_shapes
:
a
accuracyy/EqualEqualaccuracyy/ArgMaxaccuracyy/ArgMax_1*
T0	*
_output_shapes
:
Y
accuracyy/CastCastaccuracyy/Equal*

DstT0*

SrcT0
*
_output_shapes
:
G
accuracyy/RankRankaccuracyy/Cast*
T0*
_output_shapes
: 
W
accuracyy/range/startConst*
dtype0*
value	B : *
_output_shapes
: 
W
accuracyy/range/deltaConst*
dtype0*
value	B :*
_output_shapes
: 
Є
accuracyy/rangeRangeaccuracyy/range/startaccuracyy/Rankaccuracyy/range/delta*

Tidx0*#
_output_shapes
:         
w
accuracyy/MeanMeanaccuracyy/Castaccuracyy/range*
T0*
	keep_dims( *

Tidx0*
_output_shapes
:
e
accuracyy/ScalarSummary/tagsConst*
dtype0*
valueB Baccuracy*
_output_shapes
: 
w
accuracyy/ScalarSummaryScalarSummaryaccuracyy/ScalarSummary/tagsaccuracyy/Mean*
T0*
_output_shapes
: 
R
save_1/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
ю
save_1/SaveV2/tensor_namesConst*
dtype0*═
value├B└@BLayer1ConV/VariableBLayer1ConV/Variable_1BLayer1ConV_1/VariableBLayer1ConV_1/Variable_1BLayer2ConV/VariableBLayer2ConV/Variable_1BLayer2ConV_1/VariableBLayer2ConV_1/Variable_1BLayer3FC1/VariableBLayer3FC1/Variable_1BLayer3FC1_1/VariableBLayer3FC1_1/Variable_1BLayer4FC2/VariableBLayer4FC2/Variable_1BLayer4FC2_1/VariableBLayer4FC2_1/Variable_1BLayer5FC/VariableBLayer5FC/Variable_1BLayer5FC_1/VariableBLayer5FC_1/Variable_1Blossss/Layer1ConV/Variable/AdamB!lossss/Layer1ConV/Variable/Adam_1B!lossss/Layer1ConV/Variable_1/AdamB#lossss/Layer1ConV/Variable_1/Adam_1Blossss/Layer2ConV/Variable/AdamB!lossss/Layer2ConV/Variable/Adam_1B!lossss/Layer2ConV/Variable_1/AdamB#lossss/Layer2ConV/Variable_1/Adam_1Blossss/Layer3FC1/Variable/AdamB lossss/Layer3FC1/Variable/Adam_1B lossss/Layer3FC1/Variable_1/AdamB"lossss/Layer3FC1/Variable_1/Adam_1Blossss/Layer4FC2/Variable/AdamB lossss/Layer4FC2/Variable/Adam_1B lossss/Layer4FC2/Variable_1/AdamB"lossss/Layer4FC2/Variable_1/Adam_1Blossss/Layer5FC/Variable/AdamBlossss/Layer5FC/Variable/Adam_1Blossss/Layer5FC/Variable_1/AdamB!lossss/Layer5FC/Variable_1/Adam_1Blossss/beta1_powerBlossss/beta2_powerB#lossss_1/Layer1ConV_1/Variable/AdamB%lossss_1/Layer1ConV_1/Variable/Adam_1B%lossss_1/Layer1ConV_1/Variable_1/AdamB'lossss_1/Layer1ConV_1/Variable_1/Adam_1B#lossss_1/Layer2ConV_1/Variable/AdamB%lossss_1/Layer2ConV_1/Variable/Adam_1B%lossss_1/Layer2ConV_1/Variable_1/AdamB'lossss_1/Layer2ConV_1/Variable_1/Adam_1B"lossss_1/Layer3FC1_1/Variable/AdamB$lossss_1/Layer3FC1_1/Variable/Adam_1B$lossss_1/Layer3FC1_1/Variable_1/AdamB&lossss_1/Layer3FC1_1/Variable_1/Adam_1B"lossss_1/Layer4FC2_1/Variable/AdamB$lossss_1/Layer4FC2_1/Variable/Adam_1B$lossss_1/Layer4FC2_1/Variable_1/AdamB&lossss_1/Layer4FC2_1/Variable_1/Adam_1B!lossss_1/Layer5FC_1/Variable/AdamB#lossss_1/Layer5FC_1/Variable/Adam_1B#lossss_1/Layer5FC_1/Variable_1/AdamB%lossss_1/Layer5FC_1/Variable_1/Adam_1Blossss_1/beta1_powerBlossss_1/beta2_power*
_output_shapes
:@
У
save_1/SaveV2/shape_and_slicesConst*
dtype0*Ћ
valueІBѕ@B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
_output_shapes
:@
ж
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesLayer1ConV/VariableLayer1ConV/Variable_1Layer1ConV_1/VariableLayer1ConV_1/Variable_1Layer2ConV/VariableLayer2ConV/Variable_1Layer2ConV_1/VariableLayer2ConV_1/Variable_1Layer3FC1/VariableLayer3FC1/Variable_1Layer3FC1_1/VariableLayer3FC1_1/Variable_1Layer4FC2/VariableLayer4FC2/Variable_1Layer4FC2_1/VariableLayer4FC2_1/Variable_1Layer5FC/VariableLayer5FC/Variable_1Layer5FC_1/VariableLayer5FC_1/Variable_1lossss/Layer1ConV/Variable/Adam!lossss/Layer1ConV/Variable/Adam_1!lossss/Layer1ConV/Variable_1/Adam#lossss/Layer1ConV/Variable_1/Adam_1lossss/Layer2ConV/Variable/Adam!lossss/Layer2ConV/Variable/Adam_1!lossss/Layer2ConV/Variable_1/Adam#lossss/Layer2ConV/Variable_1/Adam_1lossss/Layer3FC1/Variable/Adam lossss/Layer3FC1/Variable/Adam_1 lossss/Layer3FC1/Variable_1/Adam"lossss/Layer3FC1/Variable_1/Adam_1lossss/Layer4FC2/Variable/Adam lossss/Layer4FC2/Variable/Adam_1 lossss/Layer4FC2/Variable_1/Adam"lossss/Layer4FC2/Variable_1/Adam_1lossss/Layer5FC/Variable/Adamlossss/Layer5FC/Variable/Adam_1lossss/Layer5FC/Variable_1/Adam!lossss/Layer5FC/Variable_1/Adam_1lossss/beta1_powerlossss/beta2_power#lossss_1/Layer1ConV_1/Variable/Adam%lossss_1/Layer1ConV_1/Variable/Adam_1%lossss_1/Layer1ConV_1/Variable_1/Adam'lossss_1/Layer1ConV_1/Variable_1/Adam_1#lossss_1/Layer2ConV_1/Variable/Adam%lossss_1/Layer2ConV_1/Variable/Adam_1%lossss_1/Layer2ConV_1/Variable_1/Adam'lossss_1/Layer2ConV_1/Variable_1/Adam_1"lossss_1/Layer3FC1_1/Variable/Adam$lossss_1/Layer3FC1_1/Variable/Adam_1$lossss_1/Layer3FC1_1/Variable_1/Adam&lossss_1/Layer3FC1_1/Variable_1/Adam_1"lossss_1/Layer4FC2_1/Variable/Adam$lossss_1/Layer4FC2_1/Variable/Adam_1$lossss_1/Layer4FC2_1/Variable_1/Adam&lossss_1/Layer4FC2_1/Variable_1/Adam_1!lossss_1/Layer5FC_1/Variable/Adam#lossss_1/Layer5FC_1/Variable/Adam_1#lossss_1/Layer5FC_1/Variable_1/Adam%lossss_1/Layer5FC_1/Variable_1/Adam_1lossss_1/beta1_powerlossss_1/beta2_power*N
dtypesD
B2@
Ё
save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
T0*
_class
loc:@save_1/Const*
_output_shapes
: 
y
save_1/RestoreV2/tensor_namesConst*
dtype0*(
valueBBLayer1ConV/Variable*
_output_shapes
:
j
!save_1/RestoreV2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ў
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/AssignAssignLayer1ConV/Variablesave_1/RestoreV2*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
}
save_1/RestoreV2_1/tensor_namesConst*
dtype0**
value!BBLayer1ConV/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_1/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_1	RestoreV2save_1/Constsave_1/RestoreV2_1/tensor_names#save_1/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_1AssignLayer1ConV/Variable_1save_1/RestoreV2_1*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
}
save_1/RestoreV2_2/tensor_namesConst*
dtype0**
value!BBLayer1ConV_1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_2/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_2	RestoreV2save_1/Constsave_1/RestoreV2_2/tensor_names#save_1/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_2AssignLayer1ConV_1/Variablesave_1/RestoreV2_2*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:

save_1/RestoreV2_3/tensor_namesConst*
dtype0*,
value#B!BLayer1ConV_1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_3/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_3	RestoreV2save_1/Constsave_1/RestoreV2_3/tensor_names#save_1/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_3AssignLayer1ConV_1/Variable_1save_1/RestoreV2_3*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
{
save_1/RestoreV2_4/tensor_namesConst*
dtype0*(
valueBBLayer2ConV/Variable*
_output_shapes
:
l
#save_1/RestoreV2_4/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_4	RestoreV2save_1/Constsave_1/RestoreV2_4/tensor_names#save_1/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
─
save_1/Assign_4AssignLayer2ConV/Variablesave_1/RestoreV2_4*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
}
save_1/RestoreV2_5/tensor_namesConst*
dtype0**
value!BBLayer2ConV/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_5/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_5	RestoreV2save_1/Constsave_1/RestoreV2_5/tensor_names#save_1/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_5AssignLayer2ConV/Variable_1save_1/RestoreV2_5*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
}
save_1/RestoreV2_6/tensor_namesConst*
dtype0**
value!BBLayer2ConV_1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_6/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_6	RestoreV2save_1/Constsave_1/RestoreV2_6/tensor_names#save_1/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_6AssignLayer2ConV_1/Variablesave_1/RestoreV2_6*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:

save_1/RestoreV2_7/tensor_namesConst*
dtype0*,
value#B!BLayer2ConV_1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_7/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_7	RestoreV2save_1/Constsave_1/RestoreV2_7/tensor_names#save_1/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_7AssignLayer2ConV_1/Variable_1save_1/RestoreV2_7*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
z
save_1/RestoreV2_8/tensor_namesConst*
dtype0*'
valueBBLayer3FC1/Variable*
_output_shapes
:
l
#save_1/RestoreV2_8/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_8	RestoreV2save_1/Constsave_1/RestoreV2_8/tensor_names#save_1/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
╗
save_1/Assign_8AssignLayer3FC1/Variablesave_1/RestoreV2_8*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
|
save_1/RestoreV2_9/tensor_namesConst*
dtype0*)
value BBLayer3FC1/Variable_1*
_output_shapes
:
l
#save_1/RestoreV2_9/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
ъ
save_1/RestoreV2_9	RestoreV2save_1/Constsave_1/RestoreV2_9/tensor_names#save_1/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_9AssignLayer3FC1/Variable_1save_1/RestoreV2_9*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
}
 save_1/RestoreV2_10/tensor_namesConst*
dtype0*)
value BBLayer3FC1_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_10/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_10	RestoreV2save_1/Const save_1/RestoreV2_10/tensor_names$save_1/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
┴
save_1/Assign_10AssignLayer3FC1_1/Variablesave_1/RestoreV2_10*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx

 save_1/RestoreV2_11/tensor_namesConst*
dtype0*+
value"B BLayer3FC1_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_11/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_11	RestoreV2save_1/Const save_1/RestoreV2_11/tensor_names$save_1/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_11AssignLayer3FC1_1/Variable_1save_1/RestoreV2_11*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
{
 save_1/RestoreV2_12/tensor_namesConst*
dtype0*'
valueBBLayer4FC2/Variable*
_output_shapes
:
m
$save_1/RestoreV2_12/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_12	RestoreV2save_1/Const save_1/RestoreV2_12/tensor_names$save_1/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_12AssignLayer4FC2/Variablesave_1/RestoreV2_12*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
}
 save_1/RestoreV2_13/tensor_namesConst*
dtype0*)
value BBLayer4FC2/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_13/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_13	RestoreV2save_1/Const save_1/RestoreV2_13/tensor_names$save_1/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
╝
save_1/Assign_13AssignLayer4FC2/Variable_1save_1/RestoreV2_13*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
}
 save_1/RestoreV2_14/tensor_namesConst*
dtype0*)
value BBLayer4FC2_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_14/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_14	RestoreV2save_1/Const save_1/RestoreV2_14/tensor_names$save_1/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_14AssignLayer4FC2_1/Variablesave_1/RestoreV2_14*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT

 save_1/RestoreV2_15/tensor_namesConst*
dtype0*+
value"B BLayer4FC2_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_15/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_15	RestoreV2save_1/Const save_1/RestoreV2_15/tensor_names$save_1/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
└
save_1/Assign_15AssignLayer4FC2_1/Variable_1save_1/RestoreV2_15*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
z
 save_1/RestoreV2_16/tensor_namesConst*
dtype0*&
valueBBLayer5FC/Variable*
_output_shapes
:
m
$save_1/RestoreV2_16/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_16	RestoreV2save_1/Const save_1/RestoreV2_16/tensor_names$save_1/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_16AssignLayer5FC/Variablesave_1/RestoreV2_16*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
|
 save_1/RestoreV2_17/tensor_namesConst*
dtype0*(
valueBBLayer5FC/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_17/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_17	RestoreV2save_1/Const save_1/RestoreV2_17/tensor_names$save_1/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
║
save_1/Assign_17AssignLayer5FC/Variable_1save_1/RestoreV2_17*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
|
 save_1/RestoreV2_18/tensor_namesConst*
dtype0*(
valueBBLayer5FC_1/Variable*
_output_shapes
:
m
$save_1/RestoreV2_18/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_18	RestoreV2save_1/Const save_1/RestoreV2_18/tensor_names$save_1/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
Й
save_1/Assign_18AssignLayer5FC_1/Variablesave_1/RestoreV2_18*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
~
 save_1/RestoreV2_19/tensor_namesConst*
dtype0**
value!BBLayer5FC_1/Variable_1*
_output_shapes
:
m
$save_1/RestoreV2_19/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_19	RestoreV2save_1/Const save_1/RestoreV2_19/tensor_names$save_1/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
Й
save_1/Assign_19AssignLayer5FC_1/Variable_1save_1/RestoreV2_19*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
ѕ
 save_1/RestoreV2_20/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer1ConV/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_20/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_20	RestoreV2save_1/Const save_1/RestoreV2_20/tensor_names$save_1/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_20Assignlossss/Layer1ConV/Variable/Adamsave_1/RestoreV2_20*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
і
 save_1/RestoreV2_21/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_21/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_21	RestoreV2save_1/Const save_1/RestoreV2_21/tensor_names$save_1/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
н
save_1/Assign_21Assign!lossss/Layer1ConV/Variable/Adam_1save_1/RestoreV2_21*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*&
_output_shapes
:
і
 save_1/RestoreV2_22/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer1ConV/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_22/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_22	RestoreV2save_1/Const save_1/RestoreV2_22/tensor_names$save_1/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_22Assign!lossss/Layer1ConV/Variable_1/Adamsave_1/RestoreV2_22*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
ї
 save_1/RestoreV2_23/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer1ConV/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_23/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_23	RestoreV2save_1/Const save_1/RestoreV2_23/tensor_names$save_1/RestoreV2_23/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_23Assign#lossss/Layer1ConV/Variable_1/Adam_1save_1/RestoreV2_23*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV/Variable_1*
_output_shapes
:
ѕ
 save_1/RestoreV2_24/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer2ConV/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_24/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_24	RestoreV2save_1/Const save_1/RestoreV2_24/tensor_names$save_1/RestoreV2_24/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_24Assignlossss/Layer2ConV/Variable/Adamsave_1/RestoreV2_24*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
і
 save_1/RestoreV2_25/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_25/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_25	RestoreV2save_1/Const save_1/RestoreV2_25/tensor_names$save_1/RestoreV2_25/shape_and_slices*
dtypes
2*
_output_shapes
:
н
save_1/Assign_25Assign!lossss/Layer2ConV/Variable/Adam_1save_1/RestoreV2_25*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer2ConV/Variable*&
_output_shapes
:
і
 save_1/RestoreV2_26/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer2ConV/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_26/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_26	RestoreV2save_1/Const save_1/RestoreV2_26/tensor_names$save_1/RestoreV2_26/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_26Assign!lossss/Layer2ConV/Variable_1/Adamsave_1/RestoreV2_26*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
ї
 save_1/RestoreV2_27/tensor_namesConst*
dtype0*8
value/B-B#lossss/Layer2ConV/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_27/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_27	RestoreV2save_1/Const save_1/RestoreV2_27/tensor_names$save_1/RestoreV2_27/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_27Assign#lossss/Layer2ConV/Variable_1/Adam_1save_1/RestoreV2_27*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV/Variable_1*
_output_shapes
:
Є
 save_1/RestoreV2_28/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer3FC1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_28/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_28	RestoreV2save_1/Const save_1/RestoreV2_28/tensor_names$save_1/RestoreV2_28/shape_and_slices*
dtypes
2*
_output_shapes
:
╔
save_1/Assign_28Assignlossss/Layer3FC1/Variable/Adamsave_1/RestoreV2_28*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
Ѕ
 save_1/RestoreV2_29/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_29/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_29	RestoreV2save_1/Const save_1/RestoreV2_29/tensor_names$save_1/RestoreV2_29/shape_and_slices*
dtypes
2*
_output_shapes
:
╦
save_1/Assign_29Assign lossss/Layer3FC1/Variable/Adam_1save_1/RestoreV2_29*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer3FC1/Variable*
_output_shapes
:	љx
Ѕ
 save_1/RestoreV2_30/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer3FC1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_30/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_30	RestoreV2save_1/Const save_1/RestoreV2_30/tensor_names$save_1/RestoreV2_30/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_30Assign lossss/Layer3FC1/Variable_1/Adamsave_1/RestoreV2_30*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
І
 save_1/RestoreV2_31/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer3FC1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_31/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_31	RestoreV2save_1/Const save_1/RestoreV2_31/tensor_names$save_1/RestoreV2_31/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_31Assign"lossss/Layer3FC1/Variable_1/Adam_1save_1/RestoreV2_31*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1/Variable_1*
_output_shapes
:x
Є
 save_1/RestoreV2_32/tensor_namesConst*
dtype0*3
value*B(Blossss/Layer4FC2/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_32/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_32	RestoreV2save_1/Const save_1/RestoreV2_32/tensor_names$save_1/RestoreV2_32/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_32Assignlossss/Layer4FC2/Variable/Adamsave_1/RestoreV2_32*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Ѕ
 save_1/RestoreV2_33/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_33/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_33	RestoreV2save_1/Const save_1/RestoreV2_33/tensor_names$save_1/RestoreV2_33/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_33Assign lossss/Layer4FC2/Variable/Adam_1save_1/RestoreV2_33*
use_locking(*
T0*
validate_shape(*%
_class
loc:@Layer4FC2/Variable*
_output_shapes

:xT
Ѕ
 save_1/RestoreV2_34/tensor_namesConst*
dtype0*5
value,B*B lossss/Layer4FC2/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_34/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_34	RestoreV2save_1/Const save_1/RestoreV2_34/tensor_names$save_1/RestoreV2_34/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_34Assign lossss/Layer4FC2/Variable_1/Adamsave_1/RestoreV2_34*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
І
 save_1/RestoreV2_35/tensor_namesConst*
dtype0*7
value.B,B"lossss/Layer4FC2/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_35/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_35	RestoreV2save_1/Const save_1/RestoreV2_35/tensor_names$save_1/RestoreV2_35/shape_and_slices*
dtypes
2*
_output_shapes
:
╩
save_1/Assign_35Assign"lossss/Layer4FC2/Variable_1/Adam_1save_1/RestoreV2_35*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2/Variable_1*
_output_shapes
:T
є
 save_1/RestoreV2_36/tensor_namesConst*
dtype0*2
value)B'Blossss/Layer5FC/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_36/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_36	RestoreV2save_1/Const save_1/RestoreV2_36/tensor_names$save_1/RestoreV2_36/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save_1/Assign_36Assignlossss/Layer5FC/Variable/Adamsave_1/RestoreV2_36*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
ѕ
 save_1/RestoreV2_37/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_37/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_37	RestoreV2save_1/Const save_1/RestoreV2_37/tensor_names$save_1/RestoreV2_37/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_37Assignlossss/Layer5FC/Variable/Adam_1save_1/RestoreV2_37*
use_locking(*
T0*
validate_shape(*$
_class
loc:@Layer5FC/Variable*
_output_shapes

:T+
ѕ
 save_1/RestoreV2_38/tensor_namesConst*
dtype0*4
value+B)Blossss/Layer5FC/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_38/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_38	RestoreV2save_1/Const save_1/RestoreV2_38/tensor_names$save_1/RestoreV2_38/shape_and_slices*
dtypes
2*
_output_shapes
:
к
save_1/Assign_38Assignlossss/Layer5FC/Variable_1/Adamsave_1/RestoreV2_38*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
і
 save_1/RestoreV2_39/tensor_namesConst*
dtype0*6
value-B+B!lossss/Layer5FC/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_39/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_39	RestoreV2save_1/Const save_1/RestoreV2_39/tensor_names$save_1/RestoreV2_39/shape_and_slices*
dtypes
2*
_output_shapes
:
╚
save_1/Assign_39Assign!lossss/Layer5FC/Variable_1/Adam_1save_1/RestoreV2_39*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC/Variable_1*
_output_shapes
:+
{
 save_1/RestoreV2_40/tensor_namesConst*
dtype0*'
valueBBlossss/beta1_power*
_output_shapes
:
m
$save_1/RestoreV2_40/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_40	RestoreV2save_1/Const save_1/RestoreV2_40/tensor_names$save_1/RestoreV2_40/shape_and_slices*
dtypes
2*
_output_shapes
:
х
save_1/Assign_40Assignlossss/beta1_powersave_1/RestoreV2_40*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
{
 save_1/RestoreV2_41/tensor_namesConst*
dtype0*'
valueBBlossss/beta2_power*
_output_shapes
:
m
$save_1/RestoreV2_41/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_41	RestoreV2save_1/Const save_1/RestoreV2_41/tensor_names$save_1/RestoreV2_41/shape_and_slices*
dtypes
2*
_output_shapes
:
х
save_1/Assign_41Assignlossss/beta2_powersave_1/RestoreV2_41*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer1ConV/Variable*
_output_shapes
: 
ї
 save_1/RestoreV2_42/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer1ConV_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_42/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_42	RestoreV2save_1/Const save_1/RestoreV2_42/tensor_names$save_1/RestoreV2_42/shape_and_slices*
dtypes
2*
_output_shapes
:
п
save_1/Assign_42Assign#lossss_1/Layer1ConV_1/Variable/Adamsave_1/RestoreV2_42*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
ј
 save_1/RestoreV2_43/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer1ConV_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_43/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_43	RestoreV2save_1/Const save_1/RestoreV2_43/tensor_names$save_1/RestoreV2_43/shape_and_slices*
dtypes
2*
_output_shapes
:
┌
save_1/Assign_43Assign%lossss_1/Layer1ConV_1/Variable/Adam_1save_1/RestoreV2_43*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*&
_output_shapes
:
ј
 save_1/RestoreV2_44/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer1ConV_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_44/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_44	RestoreV2save_1/Const save_1/RestoreV2_44/tensor_names$save_1/RestoreV2_44/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_44Assign%lossss_1/Layer1ConV_1/Variable_1/Adamsave_1/RestoreV2_44*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
љ
 save_1/RestoreV2_45/tensor_namesConst*
dtype0*<
value3B1B'lossss_1/Layer1ConV_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_45/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_45	RestoreV2save_1/Const save_1/RestoreV2_45/tensor_names$save_1/RestoreV2_45/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_45Assign'lossss_1/Layer1ConV_1/Variable_1/Adam_1save_1/RestoreV2_45*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer1ConV_1/Variable_1*
_output_shapes
:
ї
 save_1/RestoreV2_46/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer2ConV_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_46/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_46	RestoreV2save_1/Const save_1/RestoreV2_46/tensor_names$save_1/RestoreV2_46/shape_and_slices*
dtypes
2*
_output_shapes
:
п
save_1/Assign_46Assign#lossss_1/Layer2ConV_1/Variable/Adamsave_1/RestoreV2_46*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
ј
 save_1/RestoreV2_47/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer2ConV_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_47/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_47	RestoreV2save_1/Const save_1/RestoreV2_47/tensor_names$save_1/RestoreV2_47/shape_and_slices*
dtypes
2*
_output_shapes
:
┌
save_1/Assign_47Assign%lossss_1/Layer2ConV_1/Variable/Adam_1save_1/RestoreV2_47*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer2ConV_1/Variable*&
_output_shapes
:
ј
 save_1/RestoreV2_48/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer2ConV_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_48/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_48	RestoreV2save_1/Const save_1/RestoreV2_48/tensor_names$save_1/RestoreV2_48/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_48Assign%lossss_1/Layer2ConV_1/Variable_1/Adamsave_1/RestoreV2_48*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
љ
 save_1/RestoreV2_49/tensor_namesConst*
dtype0*<
value3B1B'lossss_1/Layer2ConV_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_49/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_49	RestoreV2save_1/Const save_1/RestoreV2_49/tensor_names$save_1/RestoreV2_49/shape_and_slices*
dtypes
2*
_output_shapes
:
м
save_1/Assign_49Assign'lossss_1/Layer2ConV_1/Variable_1/Adam_1save_1/RestoreV2_49*
use_locking(*
T0*
validate_shape(**
_class 
loc:@Layer2ConV_1/Variable_1*
_output_shapes
:
І
 save_1/RestoreV2_50/tensor_namesConst*
dtype0*7
value.B,B"lossss_1/Layer3FC1_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_50/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_50	RestoreV2save_1/Const save_1/RestoreV2_50/tensor_names$save_1/RestoreV2_50/shape_and_slices*
dtypes
2*
_output_shapes
:
¤
save_1/Assign_50Assign"lossss_1/Layer3FC1_1/Variable/Adamsave_1/RestoreV2_50*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
Ї
 save_1/RestoreV2_51/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer3FC1_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_51/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_51	RestoreV2save_1/Const save_1/RestoreV2_51/tensor_names$save_1/RestoreV2_51/shape_and_slices*
dtypes
2*
_output_shapes
:
Л
save_1/Assign_51Assign$lossss_1/Layer3FC1_1/Variable/Adam_1save_1/RestoreV2_51*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer3FC1_1/Variable*
_output_shapes
:	љx
Ї
 save_1/RestoreV2_52/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer3FC1_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_52/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_52	RestoreV2save_1/Const save_1/RestoreV2_52/tensor_names$save_1/RestoreV2_52/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_52Assign$lossss_1/Layer3FC1_1/Variable_1/Adamsave_1/RestoreV2_52*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
Ј
 save_1/RestoreV2_53/tensor_namesConst*
dtype0*;
value2B0B&lossss_1/Layer3FC1_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_53/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_53	RestoreV2save_1/Const save_1/RestoreV2_53/tensor_names$save_1/RestoreV2_53/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_53Assign&lossss_1/Layer3FC1_1/Variable_1/Adam_1save_1/RestoreV2_53*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer3FC1_1/Variable_1*
_output_shapes
:x
І
 save_1/RestoreV2_54/tensor_namesConst*
dtype0*7
value.B,B"lossss_1/Layer4FC2_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_54/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_54	RestoreV2save_1/Const save_1/RestoreV2_54/tensor_names$save_1/RestoreV2_54/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_54Assign"lossss_1/Layer4FC2_1/Variable/Adamsave_1/RestoreV2_54*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
Ї
 save_1/RestoreV2_55/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer4FC2_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_55/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_55	RestoreV2save_1/Const save_1/RestoreV2_55/tensor_names$save_1/RestoreV2_55/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_55Assign$lossss_1/Layer4FC2_1/Variable/Adam_1save_1/RestoreV2_55*
use_locking(*
T0*
validate_shape(*'
_class
loc:@Layer4FC2_1/Variable*
_output_shapes

:xT
Ї
 save_1/RestoreV2_56/tensor_namesConst*
dtype0*9
value0B.B$lossss_1/Layer4FC2_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_56/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_56	RestoreV2save_1/Const save_1/RestoreV2_56/tensor_names$save_1/RestoreV2_56/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_56Assign$lossss_1/Layer4FC2_1/Variable_1/Adamsave_1/RestoreV2_56*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
Ј
 save_1/RestoreV2_57/tensor_namesConst*
dtype0*;
value2B0B&lossss_1/Layer4FC2_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_57/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_57	RestoreV2save_1/Const save_1/RestoreV2_57/tensor_names$save_1/RestoreV2_57/shape_and_slices*
dtypes
2*
_output_shapes
:
л
save_1/Assign_57Assign&lossss_1/Layer4FC2_1/Variable_1/Adam_1save_1/RestoreV2_57*
use_locking(*
T0*
validate_shape(*)
_class
loc:@Layer4FC2_1/Variable_1*
_output_shapes
:T
і
 save_1/RestoreV2_58/tensor_namesConst*
dtype0*6
value-B+B!lossss_1/Layer5FC_1/Variable/Adam*
_output_shapes
:
m
$save_1/RestoreV2_58/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_58	RestoreV2save_1/Const save_1/RestoreV2_58/tensor_names$save_1/RestoreV2_58/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_58Assign!lossss_1/Layer5FC_1/Variable/Adamsave_1/RestoreV2_58*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
ї
 save_1/RestoreV2_59/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer5FC_1/Variable/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_59/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_59	RestoreV2save_1/Const save_1/RestoreV2_59/tensor_names$save_1/RestoreV2_59/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_59Assign#lossss_1/Layer5FC_1/Variable/Adam_1save_1/RestoreV2_59*
use_locking(*
T0*
validate_shape(*&
_class
loc:@Layer5FC_1/Variable*
_output_shapes

:T+
ї
 save_1/RestoreV2_60/tensor_namesConst*
dtype0*8
value/B-B#lossss_1/Layer5FC_1/Variable_1/Adam*
_output_shapes
:
m
$save_1/RestoreV2_60/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_60	RestoreV2save_1/Const save_1/RestoreV2_60/tensor_names$save_1/RestoreV2_60/shape_and_slices*
dtypes
2*
_output_shapes
:
╠
save_1/Assign_60Assign#lossss_1/Layer5FC_1/Variable_1/Adamsave_1/RestoreV2_60*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
ј
 save_1/RestoreV2_61/tensor_namesConst*
dtype0*:
value1B/B%lossss_1/Layer5FC_1/Variable_1/Adam_1*
_output_shapes
:
m
$save_1/RestoreV2_61/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_61	RestoreV2save_1/Const save_1/RestoreV2_61/tensor_names$save_1/RestoreV2_61/shape_and_slices*
dtypes
2*
_output_shapes
:
╬
save_1/Assign_61Assign%lossss_1/Layer5FC_1/Variable_1/Adam_1save_1/RestoreV2_61*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer5FC_1/Variable_1*
_output_shapes
:+
}
 save_1/RestoreV2_62/tensor_namesConst*
dtype0*)
value BBlossss_1/beta1_power*
_output_shapes
:
m
$save_1/RestoreV2_62/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_62	RestoreV2save_1/Const save_1/RestoreV2_62/tensor_names$save_1/RestoreV2_62/shape_and_slices*
dtypes
2*
_output_shapes
:
╣
save_1/Assign_62Assignlossss_1/beta1_powersave_1/RestoreV2_62*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
}
 save_1/RestoreV2_63/tensor_namesConst*
dtype0*)
value BBlossss_1/beta2_power*
_output_shapes
:
m
$save_1/RestoreV2_63/shape_and_slicesConst*
dtype0*
valueB
B *
_output_shapes
:
А
save_1/RestoreV2_63	RestoreV2save_1/Const save_1/RestoreV2_63/tensor_names$save_1/RestoreV2_63/shape_and_slices*
dtypes
2*
_output_shapes
:
╣
save_1/Assign_63Assignlossss_1/beta2_powersave_1/RestoreV2_63*
use_locking(*
T0*
validate_shape(*(
_class
loc:@Layer1ConV_1/Variable*
_output_shapes
: 
╬	
save_1/restore_allNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63
ш
Merge_1/MergeSummaryMergeSummaryLayer1ConV/conv1_w_smryLayer2ConV/conv2_w_smryLayer3FC1/fc1_W_smryLayer4FC2/fc2_W_smryLayer5FC/fc3_W_smryaccuracy/ScalarSummaryLayer1ConV_1/conv1_w_smryLayer2ConV_1/conv2_w_smryLayer3FC1_1/fc1_W_smryLayer4FC2_1/fc2_W_smryLayer5FC_1/fc3_W_smrylossss_1/lossaccuracyy/ScalarSummary*
N*
_output_shapes
: 
к
init_1NoOp^Layer1ConV/Variable/Assign^Layer1ConV/Variable_1/Assign^Layer2ConV/Variable/Assign^Layer2ConV/Variable_1/Assign^Layer3FC1/Variable/Assign^Layer3FC1/Variable_1/Assign^Layer4FC2/Variable/Assign^Layer4FC2/Variable_1/Assign^Layer5FC/Variable/Assign^Layer5FC/Variable_1/Assign^lossss/beta1_power/Assign^lossss/beta2_power/Assign'^lossss/Layer1ConV/Variable/Adam/Assign)^lossss/Layer1ConV/Variable/Adam_1/Assign)^lossss/Layer1ConV/Variable_1/Adam/Assign+^lossss/Layer1ConV/Variable_1/Adam_1/Assign'^lossss/Layer2ConV/Variable/Adam/Assign)^lossss/Layer2ConV/Variable/Adam_1/Assign)^lossss/Layer2ConV/Variable_1/Adam/Assign+^lossss/Layer2ConV/Variable_1/Adam_1/Assign&^lossss/Layer3FC1/Variable/Adam/Assign(^lossss/Layer3FC1/Variable/Adam_1/Assign(^lossss/Layer3FC1/Variable_1/Adam/Assign*^lossss/Layer3FC1/Variable_1/Adam_1/Assign&^lossss/Layer4FC2/Variable/Adam/Assign(^lossss/Layer4FC2/Variable/Adam_1/Assign(^lossss/Layer4FC2/Variable_1/Adam/Assign*^lossss/Layer4FC2/Variable_1/Adam_1/Assign%^lossss/Layer5FC/Variable/Adam/Assign'^lossss/Layer5FC/Variable/Adam_1/Assign'^lossss/Layer5FC/Variable_1/Adam/Assign)^lossss/Layer5FC/Variable_1/Adam_1/Assign^Layer1ConV_1/Variable/Assign^Layer1ConV_1/Variable_1/Assign^Layer2ConV_1/Variable/Assign^Layer2ConV_1/Variable_1/Assign^Layer3FC1_1/Variable/Assign^Layer3FC1_1/Variable_1/Assign^Layer4FC2_1/Variable/Assign^Layer4FC2_1/Variable_1/Assign^Layer5FC_1/Variable/Assign^Layer5FC_1/Variable_1/Assign^lossss_1/beta1_power/Assign^lossss_1/beta2_power/Assign+^lossss_1/Layer1ConV_1/Variable/Adam/Assign-^lossss_1/Layer1ConV_1/Variable/Adam_1/Assign-^lossss_1/Layer1ConV_1/Variable_1/Adam/Assign/^lossss_1/Layer1ConV_1/Variable_1/Adam_1/Assign+^lossss_1/Layer2ConV_1/Variable/Adam/Assign-^lossss_1/Layer2ConV_1/Variable/Adam_1/Assign-^lossss_1/Layer2ConV_1/Variable_1/Adam/Assign/^lossss_1/Layer2ConV_1/Variable_1/Adam_1/Assign*^lossss_1/Layer3FC1_1/Variable/Adam/Assign,^lossss_1/Layer3FC1_1/Variable/Adam_1/Assign,^lossss_1/Layer3FC1_1/Variable_1/Adam/Assign.^lossss_1/Layer3FC1_1/Variable_1/Adam_1/Assign*^lossss_1/Layer4FC2_1/Variable/Adam/Assign,^lossss_1/Layer4FC2_1/Variable/Adam_1/Assign,^lossss_1/Layer4FC2_1/Variable_1/Adam/Assign.^lossss_1/Layer4FC2_1/Variable_1/Adam_1/Assign)^lossss_1/Layer5FC_1/Variable/Adam/Assign+^lossss_1/Layer5FC_1/Variable/Adam_1/Assign+^lossss_1/Layer5FC_1/Variable_1/Adam/Assign-^lossss_1/Layer5FC_1/Variable_1/Adam_1/Assign""█
	summaries═
╩
Layer1ConV/conv1_w_smry:0
Layer2ConV/conv2_w_smry:0
Layer3FC1/fc1_W_smry:0
Layer4FC2/fc2_W_smry:0
Layer5FC/fc3_W_smry:0
accuracy/ScalarSummary:0
Layer1ConV_1/conv1_w_smry:0
Layer2ConV_1/conv2_w_smry:0
Layer3FC1_1/fc1_W_smry:0
Layer4FC2_1/fc2_W_smry:0
Layer5FC_1/fc3_W_smry:0
lossss_1/loss:0
accuracyy/ScalarSummary:0"к7
	variablesИ7х7
O
Layer1ConV/Variable:0Layer1ConV/Variable/AssignLayer1ConV/Variable/read:0
U
Layer1ConV/Variable_1:0Layer1ConV/Variable_1/AssignLayer1ConV/Variable_1/read:0
O
Layer2ConV/Variable:0Layer2ConV/Variable/AssignLayer2ConV/Variable/read:0
U
Layer2ConV/Variable_1:0Layer2ConV/Variable_1/AssignLayer2ConV/Variable_1/read:0
L
Layer3FC1/Variable:0Layer3FC1/Variable/AssignLayer3FC1/Variable/read:0
R
Layer3FC1/Variable_1:0Layer3FC1/Variable_1/AssignLayer3FC1/Variable_1/read:0
L
Layer4FC2/Variable:0Layer4FC2/Variable/AssignLayer4FC2/Variable/read:0
R
Layer4FC2/Variable_1:0Layer4FC2/Variable_1/AssignLayer4FC2/Variable_1/read:0
I
Layer5FC/Variable:0Layer5FC/Variable/AssignLayer5FC/Variable/read:0
O
Layer5FC/Variable_1:0Layer5FC/Variable_1/AssignLayer5FC/Variable_1/read:0
L
lossss/beta1_power:0lossss/beta1_power/Assignlossss/beta1_power/read:0
L
lossss/beta2_power:0lossss/beta2_power/Assignlossss/beta2_power/read:0
s
!lossss/Layer1ConV/Variable/Adam:0&lossss/Layer1ConV/Variable/Adam/Assign&lossss/Layer1ConV/Variable/Adam/read:0
y
#lossss/Layer1ConV/Variable/Adam_1:0(lossss/Layer1ConV/Variable/Adam_1/Assign(lossss/Layer1ConV/Variable/Adam_1/read:0
y
#lossss/Layer1ConV/Variable_1/Adam:0(lossss/Layer1ConV/Variable_1/Adam/Assign(lossss/Layer1ConV/Variable_1/Adam/read:0

%lossss/Layer1ConV/Variable_1/Adam_1:0*lossss/Layer1ConV/Variable_1/Adam_1/Assign*lossss/Layer1ConV/Variable_1/Adam_1/read:0
s
!lossss/Layer2ConV/Variable/Adam:0&lossss/Layer2ConV/Variable/Adam/Assign&lossss/Layer2ConV/Variable/Adam/read:0
y
#lossss/Layer2ConV/Variable/Adam_1:0(lossss/Layer2ConV/Variable/Adam_1/Assign(lossss/Layer2ConV/Variable/Adam_1/read:0
y
#lossss/Layer2ConV/Variable_1/Adam:0(lossss/Layer2ConV/Variable_1/Adam/Assign(lossss/Layer2ConV/Variable_1/Adam/read:0

%lossss/Layer2ConV/Variable_1/Adam_1:0*lossss/Layer2ConV/Variable_1/Adam_1/Assign*lossss/Layer2ConV/Variable_1/Adam_1/read:0
p
 lossss/Layer3FC1/Variable/Adam:0%lossss/Layer3FC1/Variable/Adam/Assign%lossss/Layer3FC1/Variable/Adam/read:0
v
"lossss/Layer3FC1/Variable/Adam_1:0'lossss/Layer3FC1/Variable/Adam_1/Assign'lossss/Layer3FC1/Variable/Adam_1/read:0
v
"lossss/Layer3FC1/Variable_1/Adam:0'lossss/Layer3FC1/Variable_1/Adam/Assign'lossss/Layer3FC1/Variable_1/Adam/read:0
|
$lossss/Layer3FC1/Variable_1/Adam_1:0)lossss/Layer3FC1/Variable_1/Adam_1/Assign)lossss/Layer3FC1/Variable_1/Adam_1/read:0
p
 lossss/Layer4FC2/Variable/Adam:0%lossss/Layer4FC2/Variable/Adam/Assign%lossss/Layer4FC2/Variable/Adam/read:0
v
"lossss/Layer4FC2/Variable/Adam_1:0'lossss/Layer4FC2/Variable/Adam_1/Assign'lossss/Layer4FC2/Variable/Adam_1/read:0
v
"lossss/Layer4FC2/Variable_1/Adam:0'lossss/Layer4FC2/Variable_1/Adam/Assign'lossss/Layer4FC2/Variable_1/Adam/read:0
|
$lossss/Layer4FC2/Variable_1/Adam_1:0)lossss/Layer4FC2/Variable_1/Adam_1/Assign)lossss/Layer4FC2/Variable_1/Adam_1/read:0
m
lossss/Layer5FC/Variable/Adam:0$lossss/Layer5FC/Variable/Adam/Assign$lossss/Layer5FC/Variable/Adam/read:0
s
!lossss/Layer5FC/Variable/Adam_1:0&lossss/Layer5FC/Variable/Adam_1/Assign&lossss/Layer5FC/Variable/Adam_1/read:0
s
!lossss/Layer5FC/Variable_1/Adam:0&lossss/Layer5FC/Variable_1/Adam/Assign&lossss/Layer5FC/Variable_1/Adam/read:0
y
#lossss/Layer5FC/Variable_1/Adam_1:0(lossss/Layer5FC/Variable_1/Adam_1/Assign(lossss/Layer5FC/Variable_1/Adam_1/read:0
U
Layer1ConV_1/Variable:0Layer1ConV_1/Variable/AssignLayer1ConV_1/Variable/read:0
[
Layer1ConV_1/Variable_1:0Layer1ConV_1/Variable_1/AssignLayer1ConV_1/Variable_1/read:0
U
Layer2ConV_1/Variable:0Layer2ConV_1/Variable/AssignLayer2ConV_1/Variable/read:0
[
Layer2ConV_1/Variable_1:0Layer2ConV_1/Variable_1/AssignLayer2ConV_1/Variable_1/read:0
R
Layer3FC1_1/Variable:0Layer3FC1_1/Variable/AssignLayer3FC1_1/Variable/read:0
X
Layer3FC1_1/Variable_1:0Layer3FC1_1/Variable_1/AssignLayer3FC1_1/Variable_1/read:0
R
Layer4FC2_1/Variable:0Layer4FC2_1/Variable/AssignLayer4FC2_1/Variable/read:0
X
Layer4FC2_1/Variable_1:0Layer4FC2_1/Variable_1/AssignLayer4FC2_1/Variable_1/read:0
O
Layer5FC_1/Variable:0Layer5FC_1/Variable/AssignLayer5FC_1/Variable/read:0
U
Layer5FC_1/Variable_1:0Layer5FC_1/Variable_1/AssignLayer5FC_1/Variable_1/read:0
R
lossss_1/beta1_power:0lossss_1/beta1_power/Assignlossss_1/beta1_power/read:0
R
lossss_1/beta2_power:0lossss_1/beta2_power/Assignlossss_1/beta2_power/read:0

%lossss_1/Layer1ConV_1/Variable/Adam:0*lossss_1/Layer1ConV_1/Variable/Adam/Assign*lossss_1/Layer1ConV_1/Variable/Adam/read:0
Ё
'lossss_1/Layer1ConV_1/Variable/Adam_1:0,lossss_1/Layer1ConV_1/Variable/Adam_1/Assign,lossss_1/Layer1ConV_1/Variable/Adam_1/read:0
Ё
'lossss_1/Layer1ConV_1/Variable_1/Adam:0,lossss_1/Layer1ConV_1/Variable_1/Adam/Assign,lossss_1/Layer1ConV_1/Variable_1/Adam/read:0
І
)lossss_1/Layer1ConV_1/Variable_1/Adam_1:0.lossss_1/Layer1ConV_1/Variable_1/Adam_1/Assign.lossss_1/Layer1ConV_1/Variable_1/Adam_1/read:0

%lossss_1/Layer2ConV_1/Variable/Adam:0*lossss_1/Layer2ConV_1/Variable/Adam/Assign*lossss_1/Layer2ConV_1/Variable/Adam/read:0
Ё
'lossss_1/Layer2ConV_1/Variable/Adam_1:0,lossss_1/Layer2ConV_1/Variable/Adam_1/Assign,lossss_1/Layer2ConV_1/Variable/Adam_1/read:0
Ё
'lossss_1/Layer2ConV_1/Variable_1/Adam:0,lossss_1/Layer2ConV_1/Variable_1/Adam/Assign,lossss_1/Layer2ConV_1/Variable_1/Adam/read:0
І
)lossss_1/Layer2ConV_1/Variable_1/Adam_1:0.lossss_1/Layer2ConV_1/Variable_1/Adam_1/Assign.lossss_1/Layer2ConV_1/Variable_1/Adam_1/read:0
|
$lossss_1/Layer3FC1_1/Variable/Adam:0)lossss_1/Layer3FC1_1/Variable/Adam/Assign)lossss_1/Laye