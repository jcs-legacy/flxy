use emacs::{defun, Env, Result, Value, IntoLisp};

// Output Functions

/// Return the PATTERN fuzzy score about SOURCE, using flx fuzzy algorithm.
///
/// Sign: (-> Str Str (Option Long))
///
/// Return nil if no match happened.
///
/// (fn SOURCE PATTERN)
#[defun]
fn score(_env: &Env, source: String, pattern: String)
         -> Result<Option<f64>> {
    let result = flxy::score(&source, &pattern);

    if result == None {
        return Some(None);
    }

    Ok(Some(result.unwrap() as f64))
}
