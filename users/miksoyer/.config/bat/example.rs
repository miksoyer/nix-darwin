use bat::assets_metadata::AssetsMetadata;
use bat::error::*;

/*
 * @ brief xx
 * @ param abcd
 * */
pub fn clear_assets(cache_dir: &Path) {
    clear_asset(cache_dir.join("metadata.yaml"), "metadata file");
}

// xxxjahdjkaskjd
// TODO : sjandjaskd
pub fn assets_from_cache_or_binary(
    use_custom_assets: bool,
    cache_dir: &Path,
) -> Result<HighlightingAssets> {
    if let Some(metadata) = AssetsMetadata::load_from_folder(cache_dir)? {
        if !metadata.is_compatible_with(crate_version!()) {
            return Err(format!(
            )
            .into());
        }
    }
}

fn clear_asset(path: PathBuf, description: &str) {
    print!("Clearing {description} ... ");
    match fs::remove_file(&path) {
        Err(err) if err.kind() == io::ErrorKind::NotFound => {
            println!("skipped (not present)");
        }
        Err(err) => {
            println!("could not remove the cache file {:?}: {}", &path, err);
        }
        Ok(_) => println!("okay"),
    }
}
