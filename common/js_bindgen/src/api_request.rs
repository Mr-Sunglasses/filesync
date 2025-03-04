use wasm_bindgen::prelude::*;

// create rust functions from the javascript functions
#[wasm_bindgen(module = "/src/api_request.js")]
extern "C" {
    pub async fn post(payload: JsValue, endpoint: &str) -> JsValue;
}
