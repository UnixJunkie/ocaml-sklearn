let () = Wrap_utils.init ();;
let ns = Py.import "sklearn.linear_model"

module ARDRegression = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
let create ?n_iter ?tol ?alpha_1 ?alpha_2 ?lambda_1 ?lambda_2 ?compute_score ?threshold_lambda ?fit_intercept ?normalize ?copy_X ?verbose () =
   Py.Module.get_function_with_keywords ns "ARDRegression"
     [||]
     (Wrap_utils.keyword_args [("n_iter", Wrap_utils.Option.map n_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("alpha_1", Wrap_utils.Option.map alpha_1 Py.Float.of_float); ("alpha_2", Wrap_utils.Option.map alpha_2 Py.Float.of_float); ("lambda_1", Wrap_utils.Option.map lambda_1 Py.Float.of_float); ("lambda_2", Wrap_utils.Option.map lambda_2 Py.Float.of_float); ("compute_score", Wrap_utils.Option.map compute_score Py.Bool.of_bool); ("threshold_lambda", Wrap_utils.Option.map threshold_lambda Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Bool.of_bool)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y ))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ?return_std ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("return_std", Wrap_utils.Option.map return_std Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let lambda_ self =
  match Py.Object.get_attr_string self "lambda_" with
| None -> raise (Wrap_utils.Attribute_not_found "lambda_")
| Some x -> Ndarray.of_pyobject x
let sigma_ self =
  match Py.Object.get_attr_string self "sigma_" with
| None -> raise (Wrap_utils.Attribute_not_found "sigma_")
| Some x -> Ndarray.of_pyobject x
let scores_ self =
  match Py.Object.get_attr_string self "scores_" with
| None -> raise (Wrap_utils.Attribute_not_found "scores_")
| Some x -> Py.Float.to_float x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module BayesianRidge = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
let create ?n_iter ?tol ?alpha_1 ?alpha_2 ?lambda_1 ?lambda_2 ?alpha_init ?lambda_init ?compute_score ?fit_intercept ?normalize ?copy_X ?verbose () =
   Py.Module.get_function_with_keywords ns "BayesianRidge"
     [||]
     (Wrap_utils.keyword_args [("n_iter", Wrap_utils.Option.map n_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("alpha_1", Wrap_utils.Option.map alpha_1 Py.Float.of_float); ("alpha_2", Wrap_utils.Option.map alpha_2 Py.Float.of_float); ("lambda_1", Wrap_utils.Option.map lambda_1 Py.Float.of_float); ("lambda_2", Wrap_utils.Option.map lambda_2 Py.Float.of_float); ("alpha_init", Wrap_utils.Option.map alpha_init Py.Float.of_float); ("lambda_init", Wrap_utils.Option.map lambda_init Py.Float.of_float); ("compute_score", Wrap_utils.Option.map compute_score Py.Bool.of_bool); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Bool.of_bool)])

let fit ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y ))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ?return_std ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("return_std", Wrap_utils.Option.map return_std Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let lambda_ self =
  match Py.Object.get_attr_string self "lambda_" with
| None -> raise (Wrap_utils.Attribute_not_found "lambda_")
| Some x -> Py.Float.to_float x
let sigma_ self =
  match Py.Object.get_attr_string self "sigma_" with
| None -> raise (Wrap_utils.Attribute_not_found "sigma_")
| Some x -> Ndarray.of_pyobject x
let scores_ self =
  match Py.Object.get_attr_string self "scores_" with
| None -> raise (Wrap_utils.Attribute_not_found "scores_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module ElasticNet = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?l1_ratio ?fit_intercept ?normalize ?precompute ?max_iter ?copy_X ?tol ?warm_start ?positive ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "ElasticNet"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

                  let fit ?check_input ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("check_input", Wrap_utils.Option.map check_input Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `PyObject x -> Wrap_utils.id x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let sparse_coef_ self =
  match Py.Object.get_attr_string self "sparse_coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "sparse_coef_")
| Some x -> Wrap_utils.id x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module ElasticNetCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?l1_ratio ?eps ?n_alphas ?alphas ?fit_intercept ?normalize ?precompute ?max_iter ?tol ?cv ?copy_X ?verbose ?n_jobs ?positive ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "ElasticNetCV"
                       [||]
                       (Wrap_utils.keyword_args [("l1_ratio", Wrap_utils.Option.map l1_ratio (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let l1_ratio_ self =
  match Py.Object.get_attr_string self "l1_ratio_" with
| None -> raise (Wrap_utils.Attribute_not_found "l1_ratio_")
| Some x -> Py.Float.to_float x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module HuberRegressor = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
let create ?epsilon ?max_iter ?alpha ?warm_start ?fit_intercept ?tol () =
   Py.Module.get_function_with_keywords ns "HuberRegressor"
     [||]
     (Wrap_utils.keyword_args [("epsilon", Wrap_utils.Option.map epsilon Py.Float.of_float); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("tol", Wrap_utils.Option.map tol Py.Float.of_float)])

let fit ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let scale_ self =
  match Py.Object.get_attr_string self "scale_" with
| None -> raise (Wrap_utils.Attribute_not_found "scale_")
| Some x -> Py.Float.to_float x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let outliers_ self =
  match Py.Object.get_attr_string self "outliers_" with
| None -> raise (Wrap_utils.Attribute_not_found "outliers_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module Lars = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?fit_intercept ?verbose ?normalize ?precompute ?n_nonzero_coefs ?eps ?copy_X ?fit_path () =
                     Py.Module.get_function_with_keywords ns "Lars"
                       [||]
                       (Wrap_utils.keyword_args [("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("n_nonzero_coefs", Wrap_utils.Option.map n_nonzero_coefs Py.Int.of_int); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("fit_path", Wrap_utils.Option.map fit_path Py.Bool.of_bool)])

let fit ?xy ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("Xy", Wrap_utils.Option.map xy Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Wrap_utils.id x
let active_ self =
  match Py.Object.get_attr_string self "active_" with
| None -> raise (Wrap_utils.Attribute_not_found "active_")
| Some x -> Wrap_utils.id x
let coef_path_ self =
  match Py.Object.get_attr_string self "coef_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_path_")
| Some x -> Wrap_utils.id x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LarsCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?fit_intercept ?verbose ?max_iter ?normalize ?precompute ?cv ?max_n_alphas ?n_jobs ?eps ?copy_X () =
                     Py.Module.get_function_with_keywords ns "LarsCV"
                       [||]
                       (Wrap_utils.keyword_args [("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_n_alphas", Wrap_utils.Option.map max_n_alphas Py.Int.of_int); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_path_ self =
  match Py.Object.get_attr_string self "coef_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_path_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let cv_alphas_ self =
  match Py.Object.get_attr_string self "cv_alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "cv_alphas_")
| Some x -> Ndarray.of_pyobject x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module Lasso = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?fit_intercept ?normalize ?precompute ?copy_X ?max_iter ?tol ?warm_start ?positive ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "Lasso"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

                  let fit ?check_input ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("check_input", Wrap_utils.Option.map check_input Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `PyObject x -> Wrap_utils.id x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let sparse_coef_ self =
  match Py.Object.get_attr_string self "sparse_coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "sparse_coef_")
| Some x -> Wrap_utils.id x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LassoCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?eps ?n_alphas ?alphas ?fit_intercept ?normalize ?precompute ?max_iter ?tol ?copy_X ?cv ?verbose ?n_jobs ?positive ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "LassoCV"
                       [||]
                       (Wrap_utils.keyword_args [("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let dual_gap_ self =
  match Py.Object.get_attr_string self "dual_gap_" with
| None -> raise (Wrap_utils.Attribute_not_found "dual_gap_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LassoLars = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?fit_intercept ?verbose ?normalize ?precompute ?max_iter ?eps ?copy_X ?fit_path ?positive () =
                     Py.Module.get_function_with_keywords ns "LassoLars"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("fit_path", Wrap_utils.Option.map fit_path Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool)])

let fit ?xy ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("Xy", Wrap_utils.Option.map xy Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Wrap_utils.id x
let active_ self =
  match Py.Object.get_attr_string self "active_" with
| None -> raise (Wrap_utils.Attribute_not_found "active_")
| Some x -> Wrap_utils.id x
let coef_path_ self =
  match Py.Object.get_attr_string self "coef_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_path_")
| Some x -> Wrap_utils.id x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LassoLarsCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?fit_intercept ?verbose ?max_iter ?normalize ?precompute ?cv ?max_n_alphas ?n_jobs ?eps ?copy_X ?positive () =
                     Py.Module.get_function_with_keywords ns "LassoLarsCV"
                       [||]
                       (Wrap_utils.keyword_args [("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
)); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_n_alphas", Wrap_utils.Option.map max_n_alphas Py.Int.of_int); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_path_ self =
  match Py.Object.get_attr_string self "coef_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_path_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let cv_alphas_ self =
  match Py.Object.get_attr_string self "cv_alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "cv_alphas_")
| Some x -> Ndarray.of_pyobject x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LassoLarsIC = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?criterion ?fit_intercept ?verbose ?normalize ?precompute ?max_iter ?eps ?copy_X ?positive () =
                     Py.Module.get_function_with_keywords ns "LassoLarsIC"
                       [||]
                       (Wrap_utils.keyword_args [("criterion", Wrap_utils.Option.map criterion (function
| `Bic -> Py.String.of_string "bic"
| `Aic -> Py.String.of_string "aic"
)); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool)])

let fit ?copy_X ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let criterion_ self =
  match Py.Object.get_attr_string self "criterion_" with
| None -> raise (Wrap_utils.Attribute_not_found "criterion_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LinearRegression = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?fit_intercept ?normalize ?copy_X ?n_jobs () =
                     Py.Module.get_function_with_keywords ns "LinearRegression"
                       [||]
                       (Wrap_utils.keyword_args [("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
))])

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let rank_ self =
  match Py.Object.get_attr_string self "rank_" with
| None -> raise (Wrap_utils.Attribute_not_found "rank_")
| Some x -> Py.Int.to_int x
let singular_ self =
  match Py.Object.get_attr_string self "singular_" with
| None -> raise (Wrap_utils.Attribute_not_found "singular_")
| Some x -> Wrap_utils.id x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LogisticRegression = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?penalty ?dual ?tol ?c ?fit_intercept ?intercept_scaling ?class_weight ?random_state ?solver ?max_iter ?multi_class ?verbose ?warm_start ?n_jobs ?l1_ratio () =
                     Py.Module.get_function_with_keywords ns "LogisticRegression"
                       [||]
                       (Wrap_utils.keyword_args [("penalty", Wrap_utils.Option.map penalty (function
| `L1 -> Py.String.of_string "l1"
| `L2 -> Py.String.of_string "l2"
| `Elasticnet -> Py.String.of_string "elasticnet"
| `None -> Py.String.of_string "none"
)); ("dual", Wrap_utils.Option.map dual Py.Bool.of_bool); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("C", Wrap_utils.Option.map c Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("intercept_scaling", Wrap_utils.Option.map intercept_scaling Py.Float.of_float); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("solver", Wrap_utils.Option.map solver (function
| `Newton_cg -> Py.String.of_string "newton-cg"
| `Lbfgs -> Py.String.of_string "lbfgs"
| `Liblinear -> Py.String.of_string "liblinear"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("multi_class", Wrap_utils.Option.map multi_class (function
| `Auto -> Py.String.of_string "auto"
| `Ovr -> Py.String.of_string "ovr"
| `Multinomial -> Py.String.of_string "multinomial"
)); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("n_jobs", Wrap_utils.Option.map n_jobs Py.Int.of_int); ("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float)])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let predict_log_proba ~x self =
   Py.Module.get_function_with_keywords self "predict_log_proba"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject))])
     |> Ndarray.of_pyobject
let predict_proba ~x self =
   Py.Module.get_function_with_keywords self "predict_proba"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject))])
     |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module LogisticRegressionCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?cs ?fit_intercept ?cv ?dual ?penalty ?scoring ?solver ?tol ?max_iter ?class_weight ?n_jobs ?verbose ?refit ?intercept_scaling ?multi_class ?random_state ?l1_ratios () =
                     Py.Module.get_function_with_keywords ns "LogisticRegressionCV"
                       [||]
                       (Wrap_utils.keyword_args [("Cs", Wrap_utils.Option.map cs (function
| `Int x -> Py.Int.of_int x
| `FloatList x -> (Py.List.of_list_map Py.Float.of_float) x
)); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
)); ("dual", Wrap_utils.Option.map dual Py.Bool.of_bool); ("penalty", Wrap_utils.Option.map penalty (function
| `L1 -> Py.String.of_string "l1"
| `L2 -> Py.String.of_string "l2"
| `Elasticnet -> Py.String.of_string "elasticnet"
)); ("scoring", Wrap_utils.Option.map scoring (function
| `String x -> Py.String.of_string x
| `Callable x -> Wrap_utils.id x
)); ("solver", Wrap_utils.Option.map solver (function
| `Newton_cg -> Py.String.of_string "newton-cg"
| `Lbfgs -> Py.String.of_string "lbfgs"
| `Liblinear -> Py.String.of_string "liblinear"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
)); ("n_jobs", Wrap_utils.Option.map n_jobs Py.Int.of_int); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("refit", Wrap_utils.Option.map refit Py.Bool.of_bool); ("intercept_scaling", Wrap_utils.Option.map intercept_scaling Py.Float.of_float); ("multi_class", Wrap_utils.Option.map multi_class (function
| `Ovr -> Py.String.of_string "ovr"
| `Multinomial -> Py.String.of_string "multinomial"
| `PyObject x -> Wrap_utils.id x
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("l1_ratios", l1_ratios)])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let predict_log_proba ~x self =
   Py.Module.get_function_with_keywords self "predict_log_proba"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject))])
     |> Ndarray.of_pyobject
let predict_proba ~x self =
   Py.Module.get_function_with_keywords self "predict_proba"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject))])
     |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let cs_ self =
  match Py.Object.get_attr_string self "Cs_" with
| None -> raise (Wrap_utils.Attribute_not_found "Cs_")
| Some x -> Ndarray.of_pyobject x
let l1_ratios_ self =
  match Py.Object.get_attr_string self "l1_ratios_" with
| None -> raise (Wrap_utils.Attribute_not_found "l1_ratios_")
| Some x -> Ndarray.of_pyobject x
let coefs_paths_ self =
  match Py.Object.get_attr_string self "coefs_paths_" with
| None -> raise (Wrap_utils.Attribute_not_found "coefs_paths_")
| Some x -> Wrap_utils.id x
let scores_ self =
  match Py.Object.get_attr_string self "scores_" with
| None -> raise (Wrap_utils.Attribute_not_found "scores_")
| Some x -> Wrap_utils.id x
let c_ self =
  match Py.Object.get_attr_string self "C_" with
| None -> raise (Wrap_utils.Attribute_not_found "C_")
| Some x -> Wrap_utils.id x
let l1_ratio_ self =
  match Py.Object.get_attr_string self "l1_ratio_" with
| None -> raise (Wrap_utils.Attribute_not_found "l1_ratio_")
| Some x -> Wrap_utils.id x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module MultiTaskElasticNet = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?l1_ratio ?fit_intercept ?normalize ?copy_X ?max_iter ?tol ?warm_start ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "MultiTaskElasticNet"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y ))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module MultiTaskElasticNetCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?l1_ratio ?eps ?n_alphas ?alphas ?fit_intercept ?normalize ?max_iter ?tol ?cv ?copy_X ?verbose ?n_jobs ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "MultiTaskElasticNetCV"
                       [||]
                       (Wrap_utils.keyword_args [("l1_ratio", Wrap_utils.Option.map l1_ratio (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let l1_ratio_ self =
  match Py.Object.get_attr_string self "l1_ratio_" with
| None -> raise (Wrap_utils.Attribute_not_found "l1_ratio_")
| Some x -> Py.Float.to_float x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module MultiTaskLasso = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?fit_intercept ?normalize ?copy_X ?max_iter ?tol ?warm_start ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "MultiTaskLasso"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y ))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module MultiTaskLassoCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?eps ?n_alphas ?alphas ?fit_intercept ?normalize ?max_iter ?tol ?copy_X ?cv ?verbose ?n_jobs ?random_state ?selection () =
                     Py.Module.get_function_with_keywords ns "MultiTaskLassoCV"
                       [||]
                       (Wrap_utils.keyword_args [("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("selection", Wrap_utils.Option.map selection Py.String.of_string)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let mse_path_ self =
  match Py.Object.get_attr_string self "mse_path_" with
| None -> raise (Wrap_utils.Attribute_not_found "mse_path_")
| Some x -> Ndarray.of_pyobject x
let alphas_ self =
  match Py.Object.get_attr_string self "alphas_" with
| None -> raise (Wrap_utils.Attribute_not_found "alphas_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module OrthogonalMatchingPursuit = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?n_nonzero_coefs ?tol ?fit_intercept ?normalize ?precompute () =
                     Py.Module.get_function_with_keywords ns "OrthogonalMatchingPursuit"
                       [||]
                       (Wrap_utils.keyword_args [("n_nonzero_coefs", Wrap_utils.Option.map n_nonzero_coefs Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
))])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module OrthogonalMatchingPursuitCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?copy ?fit_intercept ?normalize ?max_iter ?cv ?n_jobs ?verbose () =
                     Py.Module.get_function_with_keywords ns "OrthogonalMatchingPursuitCV"
                       [||]
                       (Wrap_utils.keyword_args [("copy", Wrap_utils.Option.map copy Py.Bool.of_bool); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
))])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let n_nonzero_coefs_ self =
  match Py.Object.get_attr_string self "n_nonzero_coefs_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_nonzero_coefs_")
| Some x -> Py.Int.to_int x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module PassiveAggressiveClassifier = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?c ?fit_intercept ?max_iter ?tol ?early_stopping ?validation_fraction ?n_iter_no_change ?shuffle ?verbose ?loss ?n_jobs ?random_state ?warm_start ?class_weight ?average () =
                     Py.Module.get_function_with_keywords ns "PassiveAggressiveClassifier"
                       [||]
                       (Wrap_utils.keyword_args [("C", Wrap_utils.Option.map c Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol (function
| `Float x -> Py.Float.of_float x
| `None -> Py.String.of_string "None"
)); ("early_stopping", Wrap_utils.Option.map early_stopping Py.Bool.of_bool); ("validation_fraction", Wrap_utils.Option.map validation_fraction Py.Float.of_float); ("n_iter_no_change", Wrap_utils.Option.map n_iter_no_change Py.Int.of_int); ("shuffle", Wrap_utils.Option.map shuffle Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("loss", Wrap_utils.Option.map loss Py.String.of_string); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
| `None -> Py.String.of_string "None"
| `PyObject x -> Wrap_utils.id x
)); ("average", Wrap_utils.Option.map average (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
))])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?coef_init ?intercept_init ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("coef_init", Wrap_utils.Option.map coef_init Ndarray.to_pyobject); ("intercept_init", Wrap_utils.Option.map intercept_init Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let partial_fit ?classes ~x ~y self =
                     Py.Module.get_function_with_keywords self "partial_fit"
                       [||]
                       (Wrap_utils.keyword_args [("classes", Wrap_utils.Option.map classes Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?kwargs self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match kwargs with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let t_ self =
  match Py.Object.get_attr_string self "t_" with
| None -> raise (Wrap_utils.Attribute_not_found "t_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module PassiveAggressiveRegressor = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?c ?fit_intercept ?max_iter ?tol ?early_stopping ?validation_fraction ?n_iter_no_change ?shuffle ?verbose ?loss ?epsilon ?random_state ?warm_start ?average () =
                     Py.Module.get_function_with_keywords ns "PassiveAggressiveRegressor"
                       [||]
                       (Wrap_utils.keyword_args [("C", Wrap_utils.Option.map c Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol (function
| `Float x -> Py.Float.of_float x
| `None -> Py.String.of_string "None"
)); ("early_stopping", Wrap_utils.Option.map early_stopping Py.Bool.of_bool); ("validation_fraction", Wrap_utils.Option.map validation_fraction Py.Float.of_float); ("n_iter_no_change", Wrap_utils.Option.map n_iter_no_change Py.Int.of_int); ("shuffle", Wrap_utils.Option.map shuffle Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("loss", Wrap_utils.Option.map loss Py.String.of_string); ("epsilon", Wrap_utils.Option.map epsilon Py.Float.of_float); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("average", Wrap_utils.Option.map average (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
))])

let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?coef_init ?intercept_init ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("coef_init", Wrap_utils.Option.map coef_init Ndarray.to_pyobject); ("intercept_init", Wrap_utils.Option.map intercept_init Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let partial_fit ~x ~y self =
                     Py.Module.get_function_with_keywords self "partial_fit"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?kwargs self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match kwargs with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let t_ self =
  match Py.Object.get_attr_string self "t_" with
| None -> raise (Wrap_utils.Attribute_not_found "t_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module Perceptron = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?penalty ?alpha ?fit_intercept ?max_iter ?tol ?shuffle ?verbose ?eta0 ?n_jobs ?random_state ?early_stopping ?validation_fraction ?n_iter_no_change ?class_weight ?warm_start () =
                     Py.Module.get_function_with_keywords ns "Perceptron"
                       [||]
                       (Wrap_utils.keyword_args [("penalty", Wrap_utils.Option.map penalty (function
| `L2 -> Py.String.of_string "l2"
| `L1 -> Py.String.of_string "l1"
| `Elasticnet -> Py.String.of_string "elasticnet"
)); ("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("shuffle", Wrap_utils.Option.map shuffle Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("eta0", Wrap_utils.Option.map eta0 Py.Float.of_float); ("n_jobs", Wrap_utils.Option.map n_jobs Py.Int.of_int); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("early_stopping", Wrap_utils.Option.map early_stopping Py.Bool.of_bool); ("validation_fraction", Wrap_utils.Option.map validation_fraction Py.Float.of_float); ("n_iter_no_change", Wrap_utils.Option.map n_iter_no_change Py.Int.of_int); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
| `PyObject x -> Wrap_utils.id x
)); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool)])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?coef_init ?intercept_init ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("coef_init", Wrap_utils.Option.map coef_init Ndarray.to_pyobject); ("intercept_init", Wrap_utils.Option.map intercept_init Ndarray.to_pyobject); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let partial_fit ?classes ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "partial_fit"
                       [||]
                       (Wrap_utils.keyword_args [("classes", Wrap_utils.Option.map classes Ndarray.to_pyobject); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?kwargs self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match kwargs with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let t_ self =
  match Py.Object.get_attr_string self "t_" with
| None -> raise (Wrap_utils.Attribute_not_found "t_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module RANSACRegressor = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?base_estimator ?min_samples ?residual_threshold ?is_data_valid ?is_model_valid ?max_trials ?max_skips ?stop_n_inliers ?stop_score ?stop_probability ?loss ?random_state () =
                     Py.Module.get_function_with_keywords ns "RANSACRegressor"
                       [||]
                       (Wrap_utils.keyword_args [("base_estimator", base_estimator); ("min_samples", Wrap_utils.Option.map min_samples (function
| `Int x -> Py.Int.of_int x
| `Float x -> Py.Float.of_float x
)); ("residual_threshold", Wrap_utils.Option.map residual_threshold Py.Float.of_float); ("is_data_valid", is_data_valid); ("is_model_valid", is_model_valid); ("max_trials", Wrap_utils.Option.map max_trials Py.Int.of_int); ("max_skips", Wrap_utils.Option.map max_skips Py.Int.of_int); ("stop_n_inliers", Wrap_utils.Option.map stop_n_inliers Py.Int.of_int); ("stop_score", Wrap_utils.Option.map stop_score Py.Float.of_float); ("stop_probability", stop_probability); ("loss", Wrap_utils.Option.map loss (function
| `String x -> Py.String.of_string x
| `Callable x -> Wrap_utils.id x
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
))])

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

let predict ~x self =
   Py.Module.get_function_with_keywords self "predict"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject))])
     |> Ndarray.of_pyobject
                  let score ~x ~y self =
                     Py.Module.get_function_with_keywords self "score"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])
                       |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let estimator_ self =
  match Py.Object.get_attr_string self "estimator_" with
| None -> raise (Wrap_utils.Attribute_not_found "estimator_")
| Some x -> Wrap_utils.id x
let n_trials_ self =
  match Py.Object.get_attr_string self "n_trials_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_trials_")
| Some x -> Py.Int.to_int x
let inlier_mask_ self =
  match Py.Object.get_attr_string self "inlier_mask_" with
| None -> raise (Wrap_utils.Attribute_not_found "inlier_mask_")
| Some x -> Wrap_utils.id x
let n_skips_no_inliers_ self =
  match Py.Object.get_attr_string self "n_skips_no_inliers_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_skips_no_inliers_")
| Some x -> Py.Int.to_int x
let n_skips_invalid_data_ self =
  match Py.Object.get_attr_string self "n_skips_invalid_data_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_skips_invalid_data_")
| Some x -> Py.Int.to_int x
let n_skips_invalid_model_ self =
  match Py.Object.get_attr_string self "n_skips_invalid_model_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_skips_invalid_model_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module Ridge = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?fit_intercept ?normalize ?copy_X ?max_iter ?tol ?solver ?random_state () =
                     Py.Module.get_function_with_keywords ns "Ridge"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("solver", Wrap_utils.Option.map solver (function
| `Auto -> Py.String.of_string "auto"
| `Svd -> Py.String.of_string "svd"
| `Cholesky -> Py.String.of_string "cholesky"
| `Lsqr -> Py.String.of_string "lsqr"
| `Sparse_cg -> Py.String.of_string "sparse_cg"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
))])

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module RidgeCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alphas ?fit_intercept ?normalize ?scoring ?cv ?gcv_mode ?store_cv_values () =
                     Py.Module.get_function_with_keywords ns "RidgeCV"
                       [||]
                       (Wrap_utils.keyword_args [("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("scoring", Wrap_utils.Option.map scoring (function
| `String x -> Py.String.of_string x
| `Callable x -> Wrap_utils.id x
)); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("gcv_mode", Wrap_utils.Option.map gcv_mode (function
| `Auto -> Py.String.of_string "auto"
| `Svd -> Py.String.of_string "svd"
| `Eigen -> Py.String.of_string "eigen"
)); ("store_cv_values", Wrap_utils.Option.map store_cv_values Py.Bool.of_bool)])

                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let cv_values_ self =
  match Py.Object.get_attr_string self "cv_values_" with
| None -> raise (Wrap_utils.Attribute_not_found "cv_values_")
| Some x -> Wrap_utils.id x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module RidgeClassifier = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alpha ?fit_intercept ?normalize ?copy_X ?max_iter ?tol ?class_weight ?solver ?random_state () =
                     Py.Module.get_function_with_keywords ns "RidgeClassifier"
                       [||]
                       (Wrap_utils.keyword_args [("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
)); ("solver", Wrap_utils.Option.map solver (function
| `Auto -> Py.String.of_string "auto"
| `Svd -> Py.String.of_string "svd"
| `Cholesky -> Py.String.of_string "cholesky"
| `Lsqr -> Py.String.of_string "lsqr"
| `Sparse_cg -> Py.String.of_string "sparse_cg"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
))])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Wrap_utils.id x
let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module RidgeClassifierCV = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?alphas ?fit_intercept ?normalize ?scoring ?cv ?class_weight ?store_cv_values () =
                     Py.Module.get_function_with_keywords ns "RidgeClassifierCV"
                       [||]
                       (Wrap_utils.keyword_args [("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("normalize", Wrap_utils.Option.map normalize Py.Bool.of_bool); ("scoring", Wrap_utils.Option.map scoring (function
| `String x -> Py.String.of_string x
| `Callable x -> Wrap_utils.id x
)); ("cv", Wrap_utils.Option.map cv (function
| `Int x -> Py.Int.of_int x
| `CrossValGenerator x -> Wrap_utils.id x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
)); ("store_cv_values", Wrap_utils.Option.map store_cv_values Py.Bool.of_bool)])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
                  let fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let cv_values_ self =
  match Py.Object.get_attr_string self "cv_values_" with
| None -> raise (Wrap_utils.Attribute_not_found "cv_values_")
| Some x -> Ndarray.of_pyobject x
let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let alpha_ self =
  match Py.Object.get_attr_string self "alpha_" with
| None -> raise (Wrap_utils.Attribute_not_found "alpha_")
| Some x -> Py.Float.to_float x
let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module SGDClassifier = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?loss ?penalty ?alpha ?l1_ratio ?fit_intercept ?max_iter ?tol ?shuffle ?verbose ?epsilon ?n_jobs ?random_state ?learning_rate ?eta0 ?power_t ?early_stopping ?validation_fraction ?n_iter_no_change ?class_weight ?warm_start ?average () =
                     Py.Module.get_function_with_keywords ns "SGDClassifier"
                       [||]
                       (Wrap_utils.keyword_args [("loss", Wrap_utils.Option.map loss Py.String.of_string); ("penalty", Wrap_utils.Option.map penalty (function
| `L2 -> Py.String.of_string "l2"
| `L1 -> Py.String.of_string "l1"
| `Elasticnet -> Py.String.of_string "elasticnet"
)); ("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("shuffle", Wrap_utils.Option.map shuffle Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("epsilon", Wrap_utils.Option.map epsilon Py.Float.of_float); ("n_jobs", Wrap_utils.Option.map n_jobs Py.Int.of_int); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("learning_rate", Wrap_utils.Option.map learning_rate Py.String.of_string); ("eta0", Wrap_utils.Option.map eta0 Py.Float.of_float); ("power_t", Wrap_utils.Option.map power_t Py.Float.of_float); ("early_stopping", Wrap_utils.Option.map early_stopping Py.Bool.of_bool); ("validation_fraction", Wrap_utils.Option.map validation_fraction Py.Float.of_float); ("n_iter_no_change", Wrap_utils.Option.map n_iter_no_change Py.Int.of_int); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
| `PyObject x -> Wrap_utils.id x
)); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("average", Wrap_utils.Option.map average (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
))])

                  let decision_function ~x self =
                     Py.Module.get_function_with_keywords self "decision_function"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?coef_init ?intercept_init ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("coef_init", Wrap_utils.Option.map coef_init Ndarray.to_pyobject); ("intercept_init", Wrap_utils.Option.map intercept_init Ndarray.to_pyobject); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let partial_fit ?classes ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "partial_fit"
                       [||]
                       (Wrap_utils.keyword_args [("classes", Wrap_utils.Option.map classes Ndarray.to_pyobject); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?kwargs self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match kwargs with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let loss_function_ self =
  match Py.Object.get_attr_string self "loss_function_" with
| None -> raise (Wrap_utils.Attribute_not_found "loss_function_")
| Some x -> Wrap_utils.id x
let classes_ self =
  match Py.Object.get_attr_string self "classes_" with
| None -> raise (Wrap_utils.Attribute_not_found "classes_")
| Some x -> Ndarray.of_pyobject x
let t_ self =
  match Py.Object.get_attr_string self "t_" with
| None -> raise (Wrap_utils.Attribute_not_found "t_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module SGDRegressor = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?loss ?penalty ?alpha ?l1_ratio ?fit_intercept ?max_iter ?tol ?shuffle ?verbose ?epsilon ?random_state ?learning_rate ?eta0 ?power_t ?early_stopping ?validation_fraction ?n_iter_no_change ?warm_start ?average () =
                     Py.Module.get_function_with_keywords ns "SGDRegressor"
                       [||]
                       (Wrap_utils.keyword_args [("loss", Wrap_utils.Option.map loss Py.String.of_string); ("penalty", Wrap_utils.Option.map penalty (function
| `L2 -> Py.String.of_string "l2"
| `L1 -> Py.String.of_string "l1"
| `Elasticnet -> Py.String.of_string "elasticnet"
)); ("alpha", Wrap_utils.Option.map alpha Py.Float.of_float); ("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("shuffle", Wrap_utils.Option.map shuffle Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("epsilon", Wrap_utils.Option.map epsilon Py.Float.of_float); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("learning_rate", Wrap_utils.Option.map learning_rate Py.String.of_string); ("eta0", Wrap_utils.Option.map eta0 Py.Float.of_float); ("power_t", Wrap_utils.Option.map power_t Py.Float.of_float); ("early_stopping", Wrap_utils.Option.map early_stopping Py.Bool.of_bool); ("validation_fraction", Wrap_utils.Option.map validation_fraction Py.Float.of_float); ("n_iter_no_change", Wrap_utils.Option.map n_iter_no_change Py.Int.of_int); ("warm_start", Wrap_utils.Option.map warm_start Py.Bool.of_bool); ("average", Wrap_utils.Option.map average (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
))])

let densify self =
   Py.Module.get_function_with_keywords self "densify"
     [||]
     []

                  let fit ?coef_init ?intercept_init ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "fit"
                       [||]
                       (Wrap_utils.keyword_args [("coef_init", Wrap_utils.Option.map coef_init Ndarray.to_pyobject); ("intercept_init", Wrap_utils.Option.map intercept_init Ndarray.to_pyobject); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let partial_fit ?sample_weight ~x ~y self =
                     Py.Module.get_function_with_keywords self "partial_fit"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?kwargs self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match kwargs with None -> [] | Some x -> x)

let sparsify self =
   Py.Module.get_function_with_keywords self "sparsify"
     [||]
     []

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let average_coef_ self =
  match Py.Object.get_attr_string self "average_coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "average_coef_")
| Some x -> Ndarray.of_pyobject x
let average_intercept_ self =
  match Py.Object.get_attr_string self "average_intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "average_intercept_")
| Some x -> Ndarray.of_pyobject x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let t_ self =
  match Py.Object.get_attr_string self "t_" with
| None -> raise (Wrap_utils.Attribute_not_found "t_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
module TheilSenRegressor = struct
type t = Py.Object.t
let of_pyobject x = x
let to_pyobject x = x
                  let create ?fit_intercept ?copy_X ?max_subpopulation ?n_subsamples ?max_iter ?tol ?random_state ?n_jobs ?verbose () =
                     Py.Module.get_function_with_keywords ns "TheilSenRegressor"
                       [||]
                       (Wrap_utils.keyword_args [("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("max_subpopulation", Wrap_utils.Option.map max_subpopulation Py.Int.of_int); ("n_subsamples", Wrap_utils.Option.map n_subsamples Py.Int.of_int); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("n_jobs", Wrap_utils.Option.map n_jobs (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("verbose", Wrap_utils.Option.map verbose Py.Bool.of_bool)])

let fit ~x ~y self =
   Py.Module.get_function_with_keywords self "fit"
     [||]
     (Wrap_utils.keyword_args [("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y ))])

let get_params ?deep self =
   Py.Module.get_function_with_keywords self "get_params"
     [||]
     (Wrap_utils.keyword_args [("deep", Wrap_utils.Option.map deep Py.Bool.of_bool)])

                  let predict ~x self =
                     Py.Module.get_function_with_keywords self "predict"
                       [||]
                       (Wrap_utils.keyword_args [("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
)))])
                       |> Ndarray.of_pyobject
let score ?sample_weight ~x ~y self =
   Py.Module.get_function_with_keywords self "score"
     [||]
     (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
     |> Py.Float.to_float
let set_params ?params self =
   Py.Module.get_function_with_keywords self "set_params"
     [||]
     (match params with None -> [] | Some x -> x)

let coef_ self =
  match Py.Object.get_attr_string self "coef_" with
| None -> raise (Wrap_utils.Attribute_not_found "coef_")
| Some x -> Ndarray.of_pyobject x
let intercept_ self =
  match Py.Object.get_attr_string self "intercept_" with
| None -> raise (Wrap_utils.Attribute_not_found "intercept_")
| Some x -> Ndarray.of_pyobject x
let breakdown_ self =
  match Py.Object.get_attr_string self "breakdown_" with
| None -> raise (Wrap_utils.Attribute_not_found "breakdown_")
| Some x -> Py.Float.to_float x
let n_iter_ self =
  match Py.Object.get_attr_string self "n_iter_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_iter_")
| Some x -> Py.Int.to_int x
let n_subpopulation_ self =
  match Py.Object.get_attr_string self "n_subpopulation_" with
| None -> raise (Wrap_utils.Attribute_not_found "n_subpopulation_")
| Some x -> Py.Int.to_int x
let to_string self = Py.Object.to_string self
let show self = to_string self
let pp formatter self = Format.fprintf formatter "%s" (show self)

end
                  let enet_path ?l1_ratio ?eps ?n_alphas ?alphas ?precompute ?xy ?copy_X ?coef_init ?verbose ?return_n_iter ?positive ?check_input ?params ~x ~y () =
                     Py.Module.get_function_with_keywords ns "enet_path"
                       [||]
                       (List.rev_append (Wrap_utils.keyword_args [("l1_ratio", Wrap_utils.Option.map l1_ratio Py.Float.of_float); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("Xy", Wrap_utils.Option.map xy Ndarray.to_pyobject); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("coef_init", Wrap_utils.Option.map coef_init (function
| `Ndarray x -> Ndarray.to_pyobject x
| `None -> Py.String.of_string "None"
)); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("check_input", Wrap_utils.Option.map check_input Py.Bool.of_bool); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))]) (match params with None -> [] | Some x -> x))
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Ndarray.of_pyobject (Py.Tuple.get x 1)), (Ndarray.of_pyobject (Py.Tuple.get x 2)), (Ndarray.of_pyobject (Py.Tuple.get x 3))))
                  let lars_path ?xy ?gram ?max_iter ?alpha_min ?method_ ?copy_X ?eps ?copy_Gram ?verbose ?return_path ?return_n_iter ?positive ~x ~y () =
                     Py.Module.get_function_with_keywords ns "lars_path"
                       [||]
                       (Wrap_utils.keyword_args [("Xy", Wrap_utils.Option.map xy Ndarray.to_pyobject); ("Gram", Wrap_utils.Option.map gram (function
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
| `None -> Py.String.of_string "None"
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("alpha_min", Wrap_utils.Option.map alpha_min Py.Float.of_float); ("method", Wrap_utils.Option.map method_ (function
| `Lar -> Py.String.of_string "lar"
| `Lasso -> Py.String.of_string "lasso"
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_Gram", Wrap_utils.Option.map copy_Gram Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("return_path", Wrap_utils.Option.map return_path Py.Bool.of_bool); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `None -> Py.String.of_string "None"
))); ("y", Some(y |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `None -> Py.String.of_string "None"
)))])
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Ndarray.of_pyobject (Py.Tuple.get x 1)), (Ndarray.of_pyobject (Py.Tuple.get x 2)), (Py.Int.to_int (Py.Tuple.get x 3))))
                  let lars_path_gram ?max_iter ?alpha_min ?method_ ?copy_X ?eps ?copy_Gram ?verbose ?return_path ?return_n_iter ?positive ~xy ~gram ~n_samples () =
                     Py.Module.get_function_with_keywords ns "lars_path_gram"
                       [||]
                       (Wrap_utils.keyword_args [("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("alpha_min", Wrap_utils.Option.map alpha_min Py.Float.of_float); ("method", Wrap_utils.Option.map method_ (function
| `Lar -> Py.String.of_string "lar"
| `Lasso -> Py.String.of_string "lasso"
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("copy_Gram", Wrap_utils.Option.map copy_Gram Py.Bool.of_bool); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("return_path", Wrap_utils.Option.map return_path Py.Bool.of_bool); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("Xy", Some(xy |> Ndarray.to_pyobject)); ("Gram", Some(gram |> Ndarray.to_pyobject)); ("n_samples", Some(n_samples |> (function
| `Int x -> Py.Int.of_int x
| `Float x -> Py.Float.of_float x
)))])
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Ndarray.of_pyobject (Py.Tuple.get x 1)), (Ndarray.of_pyobject (Py.Tuple.get x 2)), (Py.Int.to_int (Py.Tuple.get x 3))))
                  let lasso_path ?eps ?n_alphas ?alphas ?precompute ?xy ?copy_X ?coef_init ?verbose ?return_n_iter ?positive ?params ~x ~y () =
                     Py.Module.get_function_with_keywords ns "lasso_path"
                       [||]
                       (List.rev_append (Wrap_utils.keyword_args [("eps", Wrap_utils.Option.map eps Py.Float.of_float); ("n_alphas", Wrap_utils.Option.map n_alphas Py.Int.of_int); ("alphas", Wrap_utils.Option.map alphas Ndarray.to_pyobject); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
| `Ndarray x -> Ndarray.to_pyobject x
)); ("Xy", Wrap_utils.Option.map xy Ndarray.to_pyobject); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("coef_init", Wrap_utils.Option.map coef_init (function
| `Ndarray x -> Ndarray.to_pyobject x
| `None -> Py.String.of_string "None"
)); ("verbose", Wrap_utils.Option.map verbose (function
| `Bool x -> Py.Bool.of_bool x
| `Int x -> Py.Int.of_int x
)); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("positive", Wrap_utils.Option.map positive Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))]) (match params with None -> [] | Some x -> x))
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Ndarray.of_pyobject (Py.Tuple.get x 1)), (Ndarray.of_pyobject (Py.Tuple.get x 2)), (Ndarray.of_pyobject (Py.Tuple.get x 3))))
                  let logistic_regression_path ?pos_class ?cs ?fit_intercept ?max_iter ?tol ?verbose ?solver ?coef ?class_weight ?dual ?penalty ?intercept_scaling ?multi_class ?random_state ?check_input ?max_squared_sum ?sample_weight ?l1_ratio ~x ~y () =
                     Py.Module.get_function_with_keywords ns "logistic_regression_path"
                       [||]
                       (Wrap_utils.keyword_args [("pos_class", Wrap_utils.Option.map pos_class (function
| `Int x -> Py.Int.of_int x
| `None -> Py.String.of_string "None"
)); ("Cs", Wrap_utils.Option.map cs (function
| `Int x -> Py.Int.of_int x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("fit_intercept", Wrap_utils.Option.map fit_intercept Py.Bool.of_bool); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("solver", Wrap_utils.Option.map solver (function
| `Lbfgs -> Py.String.of_string "lbfgs"
| `Newton_cg -> Py.String.of_string "newton-cg"
| `Liblinear -> Py.String.of_string "liblinear"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("coef", Wrap_utils.Option.map coef Ndarray.to_pyobject); ("class_weight", Wrap_utils.Option.map class_weight (function
| `DictIntToFloat x -> (Py.Dict.of_bindings_map Py.Int.of_int Py.Float.of_float) x
| `Balanced -> Py.String.of_string "balanced"
)); ("dual", Wrap_utils.Option.map dual Py.Bool.of_bool); ("penalty", Wrap_utils.Option.map penalty (function
| `L1 -> Py.String.of_string "l1"
| `L2 -> Py.String.of_string "l2"
| `Elasticnet -> Py.String.of_string "elasticnet"
)); ("intercept_scaling", Wrap_utils.Option.map intercept_scaling Py.Float.of_float); ("multi_class", Wrap_utils.Option.map multi_class (function
| `Ovr -> Py.String.of_string "ovr"
| `Multinomial -> Py.String.of_string "multinomial"
| `Auto -> Py.String.of_string "auto"
)); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
| `None -> Py.String.of_string "None"
)); ("check_input", Wrap_utils.Option.map check_input Py.Bool.of_bool); ("max_squared_sum", Wrap_utils.Option.map max_squared_sum Py.Float.of_float); ("sample_weight", Wrap_utils.Option.map sample_weight Ndarray.to_pyobject); ("l1_ratio", Wrap_utils.Option.map l1_ratio (function
| `Float x -> Py.Float.of_float x
| `None -> Py.String.of_string "None"
)); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
))); ("y", Some(y |> Ndarray.to_pyobject))])
                       |> (fun x -> ((Wrap_utils.id (Py.Tuple.get x 0)), (Ndarray.of_pyobject (Py.Tuple.get x 1)), (Ndarray.of_pyobject (Py.Tuple.get x 2))))
                  let orthogonal_mp ?n_nonzero_coefs ?tol ?precompute ?copy_X ?return_path ?return_n_iter ~x ~y () =
                     Py.Module.get_function_with_keywords ns "orthogonal_mp"
                       [||]
                       (Wrap_utils.keyword_args [("n_nonzero_coefs", Wrap_utils.Option.map n_nonzero_coefs Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("precompute", Wrap_utils.Option.map precompute (function
| `Bool x -> Py.Bool.of_bool x
| `Auto -> Py.String.of_string "auto"
)); ("copy_X", Wrap_utils.Option.map copy_X Py.Bool.of_bool); ("return_path", Wrap_utils.Option.map return_path Py.Bool.of_bool); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("X", Some(x |> Ndarray.to_pyobject)); ("y", Some(y |> Ndarray.to_pyobject))])
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Wrap_utils.id (Py.Tuple.get x 1))))
let orthogonal_mp_gram ?n_nonzero_coefs ?tol ?norms_squared ?copy_Gram ?copy_Xy ?return_path ?return_n_iter ~gram ~xy () =
   Py.Module.get_function_with_keywords ns "orthogonal_mp_gram"
     [||]
     (Wrap_utils.keyword_args [("n_nonzero_coefs", Wrap_utils.Option.map n_nonzero_coefs Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("norms_squared", Wrap_utils.Option.map norms_squared Ndarray.to_pyobject); ("copy_Gram", Wrap_utils.Option.map copy_Gram Py.Bool.of_bool); ("copy_Xy", Wrap_utils.Option.map copy_Xy Py.Bool.of_bool); ("return_path", Wrap_utils.Option.map return_path Py.Bool.of_bool); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("Gram", Some(gram |> Ndarray.to_pyobject)); ("Xy", Some(xy |> Ndarray.to_pyobject))])
     |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Wrap_utils.id (Py.Tuple.get x 1))))
                  let ridge_regression ?sample_weight ?solver ?max_iter ?tol ?verbose ?random_state ?return_n_iter ?return_intercept ?check_input ~x ~y ~alpha () =
                     Py.Module.get_function_with_keywords ns "ridge_regression"
                       [||]
                       (Wrap_utils.keyword_args [("sample_weight", Wrap_utils.Option.map sample_weight (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)); ("solver", Wrap_utils.Option.map solver (function
| `Auto -> Py.String.of_string "auto"
| `Svd -> Py.String.of_string "svd"
| `Cholesky -> Py.String.of_string "cholesky"
| `Lsqr -> Py.String.of_string "lsqr"
| `Sparse_cg -> Py.String.of_string "sparse_cg"
| `Sag -> Py.String.of_string "sag"
| `Saga -> Py.String.of_string "saga"
)); ("max_iter", Wrap_utils.Option.map max_iter Py.Int.of_int); ("tol", Wrap_utils.Option.map tol Py.Float.of_float); ("verbose", Wrap_utils.Option.map verbose Py.Int.of_int); ("random_state", Wrap_utils.Option.map random_state (function
| `Int x -> Py.Int.of_int x
| `RandomState x -> Wrap_utils.id x
)); ("return_n_iter", Wrap_utils.Option.map return_n_iter Py.Bool.of_bool); ("return_intercept", Wrap_utils.Option.map return_intercept Py.Bool.of_bool); ("check_input", Wrap_utils.Option.map check_input Py.Bool.of_bool); ("X", Some(x |> (function
| `Ndarray x -> Ndarray.to_pyobject x
| `SparseMatrix x -> Csr_matrix.to_pyobject x
| `LinearOperator x -> Wrap_utils.id x
))); ("y", Some(y |> Ndarray.to_pyobject)); ("alpha", Some(alpha |> (function
| `Float x -> Py.Float.of_float x
| `Ndarray x -> Ndarray.to_pyobject x
)))])
                       |> (fun x -> ((Ndarray.of_pyobject (Py.Tuple.get x 0)), (Py.Int.to_int (Py.Tuple.get x 1)), (Wrap_utils.id (Py.Tuple.get x 2))))