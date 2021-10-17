use emacs::{defun, Env, Result, Value, IntoLisp};

// Output Functions

/// Return the PATTERN fuzzy score about SOURCE, using flx fuzzy algorithm.
///
/// Sign: (-> Str Str (Option Long))
///
/// Return nil if no match happened.
///
/// (fn PATTERN SOURCE)
#[defun]
fn score(_env: &Env, pattern: String, source: String)
                   -> Result<Option<f64>> {
    Ok(flxy::score(&pattern, &source) as f64)
}
