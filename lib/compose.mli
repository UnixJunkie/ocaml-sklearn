module ColumnTransformer : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?remainder:[`Drop | `Passthrough | `Estimator of Py.Object.t] -> ?sparse_threshold:float -> ?n_jobs:[`Int of int | `None] -> ?transformer_weights:Py.Object.t -> ?verbose:bool -> transformers:Py.Object.t -> unit -> t
(**
Applies transformers to columns of an array or pandas DataFrame.

This estimator allows different columns or column subsets of the input
to be transformed separately and the features generated by each transformer
will be concatenated to form a single feature space.
This is useful for heterogeneous or columnar data, to combine several
feature extraction mechanisms or transformations into a single transformer.

Read more in the :ref:`User Guide <column_transformer>`.

.. versionadded:: 0.20

Parameters
----------
transformers : list of tuples
    List of (name, transformer, column(s)) tuples specifying the
    transformer objects to be applied to subsets of the data.

    name : string
        Like in Pipeline and FeatureUnion, this allows the transformer and
        its parameters to be set using ``set_params`` and searched in grid
        search.
    transformer : estimator or {'passthrough', 'drop'}
        Estimator must support :term:`fit` and :term:`transform`.
        Special-cased strings 'drop' and 'passthrough' are accepted as
        well, to indicate to drop the columns or to pass them through
        untransformed, respectively.
    column(s) : string or int, array-like of string or int, slice, boolean mask array or callable
        Indexes the data on its second axis. Integers are interpreted as
        positional columns, while strings can reference DataFrame columns
        by name.  A scalar string or int should be used where
        ``transformer`` expects X to be a 1d array-like (vector),
        otherwise a 2d array will be passed to the transformer.
        A callable is passed the input data `X` and can return any of the
        above. To select multiple columns by name or dtype, you can use
        :obj:`make_column_transformer`.

remainder : {'drop', 'passthrough'} or estimator, default 'drop'
    By default, only the specified columns in `transformers` are
    transformed and combined in the output, and the non-specified
    columns are dropped. (default of ``'drop'``).
    By specifying ``remainder='passthrough'``, all remaining columns that
    were not specified in `transformers` will be automatically passed
    through. This subset of columns is concatenated with the output of
    the transformers.
    By setting ``remainder`` to be an estimator, the remaining
    non-specified columns will use the ``remainder`` estimator. The
    estimator must support :term:`fit` and :term:`transform`.
    Note that using this feature requires that the DataFrame columns
    input at :term:`fit` and :term:`transform` have identical order.

sparse_threshold : float, default = 0.3
    If the output of the different transformers contains sparse matrices,
    these will be stacked as a sparse matrix if the overall density is
    lower than this value. Use ``sparse_threshold=0`` to always return
    dense.  When the transformed output consists of all dense data, the
    stacked result will be dense, and this keyword will be ignored.

n_jobs : int or None, optional (default=None)
    Number of jobs to run in parallel.
    ``None`` means 1 unless in a :obj:`joblib.parallel_backend` context.
    ``-1`` means using all processors. See :term:`Glossary <n_jobs>`
    for more details.

transformer_weights : dict, optional
    Multiplicative weights for features per transformer. The output of the
    transformer is multiplied by these weights. Keys are transformer names,
    values the weights.

verbose : boolean, optional(default=False)
    If True, the time elapsed while fitting each transformer will be
    printed as it is completed.

Attributes
----------
transformers_ : list
    The collection of fitted transformers as tuples of
    (name, fitted_transformer, column). `fitted_transformer` can be an
    estimator, 'drop', or 'passthrough'. In case there were no columns
    selected, this will be the unfitted transformer.
    If there are remaining columns, the final element is a tuple of the
    form:
    ('remainder', transformer, remaining_columns) corresponding to the
    ``remainder`` parameter. If there are remaining columns, then
    ``len(transformers_)==len(transformers)+1``, otherwise
    ``len(transformers_)==len(transformers)``.

named_transformers_ : Bunch object, a dictionary with attribute access
    Read-only attribute to access any transformer by given name.
    Keys are transformer names and values are the fitted transformer
    objects.

sparse_output_ : boolean
    Boolean flag indicating wether the output of ``transform`` is a
    sparse matrix or a dense numpy array, which depends on the output
    of the individual transformers and the `sparse_threshold` keyword.

Notes
-----
The order of the columns in the transformed feature matrix follows the
order of how the columns are specified in the `transformers` list.
Columns of the original feature matrix that are not specified are
dropped from the resulting transformed feature matrix, unless specified
in the `passthrough` keyword. Those columns specified with `passthrough`
are added at the right to the output of the transformers.

See also
--------
sklearn.compose.make_column_transformer : convenience function for
    combining the outputs of multiple transformer objects applied to
    column subsets of the original feature space.
sklearn.compose.make_column_selector : convenience function for selecting
    columns based on datatype or the columns name with a regex pattern.

Examples
--------
>>> import numpy as np
>>> from sklearn.compose import ColumnTransformer
>>> from sklearn.preprocessing import Normalizer
>>> ct = ColumnTransformer(
...     [("norm1", Normalizer(norm='l1'), [0, 1]),
...      ("norm2", Normalizer(norm='l1'), slice(2, 4))])
>>> X = np.array([[0., 1., 2., 2.],
...               [1., 1., 0., 1.]])
>>> # Normalizer scales each row of X to unit norm. A separate scaling
>>> # is applied for the two first and two last elements of each
>>> # row independently.
>>> ct.fit_transform(X)
array([[0. , 1. , 0.5, 0.5],
       [0.5, 0.5, 0. , 1. ]])
*)

val fit : ?y:Ndarray.t -> x:[`Ndarray of Ndarray.t | `PyObject of Py.Object.t] -> t -> t
(**
Fit all transformers using X.

Parameters
----------
X : array-like or DataFrame of shape [n_samples, n_features]
    Input data, of which specified subsets are used to fit the
    transformers.

y : array-like, shape (n_samples, ...), optional
    Targets for supervised learning.

Returns
-------
self : ColumnTransformer
    This estimator
*)

val fit_transform : ?y:Ndarray.t -> x:[`Ndarray of Ndarray.t | `PyObject of Py.Object.t] -> t -> Ndarray.t
(**
Fit all transformers, transform the data and concatenate results.

Parameters
----------
X : array-like or DataFrame of shape [n_samples, n_features]
    Input data, of which specified subsets are used to fit the
    transformers.

y : array-like, shape (n_samples, ...), optional
    Targets for supervised learning.

Returns
-------
X_t : array-like or sparse matrix, shape (n_samples, sum_n_components)
    hstack of results of transformers. sum_n_components is the
    sum of n_components (output dimension) over transformers. If
    any result is a sparse matrix, everything will be converted to
    sparse matrices.
*)

val get_feature_names : t -> string list
(**
Get feature names from all transformers.

Returns
-------
feature_names : list of strings
    Names of the features produced by transform.
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : boolean, optional
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val set_params : ?kwargs:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

Valid parameter keys can be listed with ``get_params()``.

Returns
-------
self
*)

val transform : x:[`Ndarray of Ndarray.t | `PyObject of Py.Object.t] -> t -> Ndarray.t
(**
Transform X separately by each transformer, concatenate results.

Parameters
----------
X : array-like or DataFrame of shape [n_samples, n_features]
    The data to be transformed by subset.

Returns
-------
X_t : array-like or sparse matrix, shape (n_samples, sum_n_components)
    hstack of results of transformers. sum_n_components is the
    sum of n_components (output dimension) over transformers. If
    any result is a sparse matrix, everything will be converted to
    sparse matrices.
*)


(** Attribute transformers_: see constructor for documentation *)
val transformers_ : t -> Py.Object.t

(** Attribute named_transformers_: see constructor for documentation *)
val named_transformers_ : t -> Py.Object.t

(** Attribute sparse_output_: see constructor for documentation *)
val sparse_output_ : t -> bool

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module TransformedTargetRegressor : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?regressor:Py.Object.t -> ?transformer:Py.Object.t -> ?func:Py.Object.t -> ?inverse_func:Py.Object.t -> ?check_inverse:bool -> unit -> t
(**
Meta-estimator to regress on a transformed target.

Useful for applying a non-linear transformation to the target ``y`` in
regression problems. This transformation can be given as a Transformer
such as the QuantileTransformer or as a function and its inverse such as
``log`` and ``exp``.

The computation during ``fit`` is::

    regressor.fit(X, func(y))

or::

    regressor.fit(X, transformer.transform(y))

The computation during ``predict`` is::

    inverse_func(regressor.predict(X))

or::

    transformer.inverse_transform(regressor.predict(X))

Read more in the :ref:`User Guide <transformed_target_regressor>`.

Parameters
----------
regressor : object, default=LinearRegression()
    Regressor object such as derived from ``RegressorMixin``. This
    regressor will automatically be cloned each time prior to fitting.

transformer : object, default=None
    Estimator object such as derived from ``TransformerMixin``. Cannot be
    set at the same time as ``func`` and ``inverse_func``. If
    ``transformer`` is ``None`` as well as ``func`` and ``inverse_func``,
    the transformer will be an identity transformer. Note that the
    transformer will be cloned during fitting. Also, the transformer is
    restricting ``y`` to be a numpy array.

func : function, optional
    Function to apply to ``y`` before passing to ``fit``. Cannot be set at
    the same time as ``transformer``. The function needs to return a
    2-dimensional array. If ``func`` is ``None``, the function used will be
    the identity function.

inverse_func : function, optional
    Function to apply to the prediction of the regressor. Cannot be set at
    the same time as ``transformer`` as well. The function needs to return
    a 2-dimensional array. The inverse function is used to return
    predictions to the same space of the original training labels.

check_inverse : bool, default=True
    Whether to check that ``transform`` followed by ``inverse_transform``
    or ``func`` followed by ``inverse_func`` leads to the original targets.

Attributes
----------
regressor_ : object
    Fitted regressor.

transformer_ : object
    Transformer used in ``fit`` and ``predict``.

Examples
--------
>>> import numpy as np
>>> from sklearn.linear_model import LinearRegression
>>> from sklearn.compose import TransformedTargetRegressor
>>> tt = TransformedTargetRegressor(regressor=LinearRegression(),
...                                 func=np.log, inverse_func=np.exp)
>>> X = np.arange(4).reshape(-1, 1)
>>> y = np.exp(2 * X).ravel()
>>> tt.fit(X, y)
TransformedTargetRegressor(...)
>>> tt.score(X, y)
1.0
>>> tt.regressor_.coef_
array([2.])

Notes
-----
Internally, the target ``y`` is always converted into a 2-dimensional array
to be used by scikit-learn transformers. At the time of prediction, the
output will be reshaped to a have the same number of dimensions as ``y``.

See :ref:`examples/compose/plot_transformed_target.py
<sphx_glr_auto_examples_compose_plot_transformed_target.py>`.
*)

val fit : ?fit_params:(string * Py.Object.t) list -> x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> y:Ndarray.t -> t -> t
(**
Fit the model according to the given training data.

Parameters
----------
X : {array-like, sparse matrix}, shape (n_samples, n_features)
    Training vector, where n_samples is the number of samples and
    n_features is the number of features.

y : array-like, shape (n_samples,)
    Target values.

**fit_params : dict of string -> object
    Parameters passed to the ``fit`` method of the underlying
    regressor.


Returns
-------
self : object
*)

val get_params : ?deep:bool -> t -> Py.Object.t
(**
Get parameters for this estimator.

Parameters
----------
deep : bool, default=True
    If True, will return the parameters for this estimator and
    contained subobjects that are estimators.

Returns
-------
params : mapping of string to any
    Parameter names mapped to their values.
*)

val predict : x:[`Ndarray of Ndarray.t | `SparseMatrix of Csr_matrix.t] -> t -> Ndarray.t
(**
Predict using the base regressor, applying inverse.

The regressor is used to predict and the ``inverse_func`` or
``inverse_transform`` is applied before returning the prediction.

Parameters
----------
X : {array-like, sparse matrix} of shape (n_samples, n_features)
    Samples.

Returns
-------
y_hat : array, shape = (n_samples,)
    Predicted values.
*)

val score : ?sample_weight:Ndarray.t -> x:Ndarray.t -> y:Ndarray.t -> t -> float
(**
Return the coefficient of determination R^2 of the prediction.

The coefficient R^2 is defined as (1 - u/v), where u is the residual
sum of squares ((y_true - y_pred) ** 2).sum() and v is the total
sum of squares ((y_true - y_true.mean()) ** 2).sum().
The best possible score is 1.0 and it can be negative (because the
model can be arbitrarily worse). A constant model that always
predicts the expected value of y, disregarding the input features,
would get a R^2 score of 0.0.

Parameters
----------
X : array-like of shape (n_samples, n_features)
    Test samples. For some estimators this may be a
    precomputed kernel matrix or a list of generic objects instead,
    shape = (n_samples, n_samples_fitted),
    where n_samples_fitted is the number of
    samples used in the fitting for the estimator.

y : array-like of shape (n_samples,) or (n_samples, n_outputs)
    True values for X.

sample_weight : array-like of shape (n_samples,), default=None
    Sample weights.

Returns
-------
score : float
    R^2 of self.predict(X) wrt. y.

Notes
-----
The R2 score used when calling ``score`` on a regressor will use
``multioutput='uniform_average'`` from version 0.23 to keep consistent
with :func:`~sklearn.metrics.r2_score`. This will influence the
``score`` method of all the multioutput regressors (except for
:class:`~sklearn.multioutput.MultiOutputRegressor`). To specify the
default value manually and avoid the warning, please either call
:func:`~sklearn.metrics.r2_score` directly or make a custom scorer with
:func:`~sklearn.metrics.make_scorer` (the built-in scorer ``'r2'`` uses
``multioutput='uniform_average'``).
*)

val set_params : ?params:(string * Py.Object.t) list -> t -> t
(**
Set the parameters of this estimator.

The method works on simple estimators as well as on nested objects
(such as pipelines). The latter have parameters of the form
``<component>__<parameter>`` so that it's possible to update each
component of a nested object.

Parameters
----------
**params : dict
    Estimator parameters.

Returns
-------
self : object
    Estimator instance.
*)


(** Attribute regressor_: see constructor for documentation *)
val regressor_ : t -> Py.Object.t

(** Attribute transformer_: see constructor for documentation *)
val transformer_ : t -> Py.Object.t

(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

module Make_column_selector : sig
type t
val of_pyobject : Py.Object.t -> t
val to_pyobject : t -> Py.Object.t

val create : ?pattern:string -> ?dtype_include:Py.Object.t -> ?dtype_exclude:Py.Object.t -> unit -> t
(**
Create a callable to select columns to be used with
:class:`ColumnTransformer`.

:func:`make_column_selector` can select columns based on datatype or the
columns name with a regex. When using multiple selection criteria, **all**
criteria must match for a column to be selected.

Parameters
----------
pattern : str, default=None
    Name of columns containing this regex pattern will be included. If
    None, column selection will not be selected based on pattern.

dtype_include : column dtype or list of column dtypes, default=None
    A selection of dtypes to include. For more details, see
    :meth:`pandas.DataFrame.select_dtypes`.

dtype_exclude : column dtype or list of column dtypes, default=None
    A selection of dtypes to exclude. For more details, see
    :meth:`pandas.DataFrame.select_dtypes`.

Returns
-------
selector : callable
    Callable for column selection to be used by a
    :class:`ColumnTransformer`.

See also
--------
sklearn.compose.ColumnTransformer : Class that allows combining the
    outputs of multiple transformer objects used on column subsets
    of the data into a single feature space.

Examples
--------
>>> from sklearn.preprocessing import StandardScaler, OneHotEncoder
>>> from sklearn.compose import make_column_transformer
>>> from sklearn.compose import make_column_selector
>>> import pandas as pd  # doctest: +SKIP
>>> X = pd.DataFrame({'city': ['London', 'London', 'Paris', 'Sallisaw'],
...                   'rating': [5, 3, 4, 5]})  # doctest: +SKIP
>>> ct = make_column_transformer(
...       (StandardScaler(),
...        make_column_selector(dtype_include=np.number)),  # rating
...       (OneHotEncoder(),
...        make_column_selector(dtype_include=object)))  # city
>>> ct.fit_transform(X)  # doctest: +SKIP
array([[ 0.90453403,  1.        ,  0.        ,  0.        ],
       [-1.50755672,  1.        ,  0.        ,  0.        ],
       [-0.30151134,  0.        ,  1.        ,  0.        ],
       [ 0.90453403,  0.        ,  0.        ,  1.        ]])
*)


(** Print the object to a human-readable representation. *)
val to_string : t -> string


(** Print the object to a human-readable representation. *)
val show : t -> string

(** Pretty-print the object to a formatter. *)
val pp : Format.formatter -> t -> unit


end

val make_column_transformer : ?kwargs:(string * Py.Object.t) list -> Py.Object.t list -> Py.Object.t
(**
Construct a ColumnTransformer from the given transformers.

This is a shorthand for the ColumnTransformer constructor; it does not
require, and does not permit, naming the transformers. Instead, they will
be given names automatically based on their types. It also does not allow
weighting with ``transformer_weights``.

Read more in the :ref:`User Guide <make_column_transformer>`.

Parameters
----------
*transformers : tuples
    Tuples of the form (transformer, column(s)) specifying the
    transformer objects to be applied to subsets of the data.

    transformer : estimator or {'passthrough', 'drop'}
        Estimator must support :term:`fit` and :term:`transform`.
        Special-cased strings 'drop' and 'passthrough' are accepted as
        well, to indicate to drop the columns or to pass them through
        untransformed, respectively.
    column(s) : string or int, array-like of string or int, slice, boolean mask array or callable
        Indexes the data on its second axis. Integers are interpreted as
        positional columns, while strings can reference DataFrame columns
        by name. A scalar string or int should be used where
        ``transformer`` expects X to be a 1d array-like (vector),
        otherwise a 2d array will be passed to the transformer.
        A callable is passed the input data `X` and can return any of the
        above.

remainder : {'drop', 'passthrough'} or estimator, default 'drop'
    By default, only the specified columns in `transformers` are
    transformed and combined in the output, and the non-specified
    columns are dropped. (default of ``'drop'``).
    By specifying ``remainder='passthrough'``, all remaining columns that
    were not specified in `transformers` will be automatically passed
    through. This subset of columns is concatenated with the output of
    the transformers.
    By setting ``remainder`` to be an estimator, the remaining
    non-specified columns will use the ``remainder`` estimator. The
    estimator must support :term:`fit` and :term:`transform`.

sparse_threshold : float, default = 0.3
    If the transformed output consists of a mix of sparse and dense data,
    it will be stacked as a sparse matrix if the density is lower than this
    value. Use ``sparse_threshold=0`` to always return dense.
    When the transformed output consists of all sparse or all dense data,
    the stacked result will be sparse or dense, respectively, and this
    keyword will be ignored.

n_jobs : int or None, optional (default=None)
    Number of jobs to run in parallel.
    ``None`` means 1 unless in a :obj:`joblib.parallel_backend` context.
    ``-1`` means using all processors. See :term:`Glossary <n_jobs>`
    for more details.

verbose : boolean, optional(default=False)
    If True, the time elapsed while fitting each transformer will be
    printed as it is completed.

Returns
-------
ct : ColumnTransformer

See also
--------
sklearn.compose.ColumnTransformer : Class that allows combining the
    outputs of multiple transformer objects used on column subsets
    of the data into a single feature space.

Examples
--------
>>> from sklearn.preprocessing import StandardScaler, OneHotEncoder
>>> from sklearn.compose import make_column_transformer
>>> make_column_transformer(
...     (StandardScaler(), ['numerical_column']),
...     (OneHotEncoder(), ['categorical_column']))
ColumnTransformer(transformers=[('standardscaler', StandardScaler(...),
                                 ['numerical_column']),
                                ('onehotencoder', OneHotEncoder(...),
                                 ['categorical_column'])])
*)

