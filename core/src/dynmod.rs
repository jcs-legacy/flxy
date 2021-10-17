/**
 * $File: dynmod.rs $
 * $Date: 2021-10-17 23:17:32 $
 * $Revision: $
 * $Creator: Jen-Chieh Shen $
 * $Notice: See LICENSE.txt for modification and distribution information
 *                   Copyright © 2021 by Shen, Jen-Chieh $
 */
use emacs::{defun, Env, Result, Value, IntoLisp};

fn flxy_score(source: &str, pattern: &str) -> Option<f64> {
    let result = flxy::score(source, pattern);
    if result == None {
        return None;
    }
    return Some(result.unwrap() as f64)
}

// Output Functions

/// Return the PATTERN fuzzy score about SOURCE, using flx fuzzy algorithm.
///
/// Sign: (-> Str Str (Option Long))
///
/// Return nil if no match happened.
///
/// (fn SOURCE PATTERN)
#[defun]
fn score(_env: &Env, source: String, pattern: String) -> Result<Option<f64>> {
    Ok(flxy_score(&source, &pattern))
}
