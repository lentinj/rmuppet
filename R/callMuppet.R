#' callMuppet
#'
#' @param ... commandline arguments to the Muppet program
#'
#' @return
#' @export
callMuppet <- function(...){
  
  args <- c(...)
  
  if('run_dir' %in% names(args)){
    old.dir <- getwd()
    setwd(args[['run_dir']])
    args <- args[names(args)!='run_dir']
  }
  
  run.string <- 
    stringr::str_c(findMuppet(), ' ',
                   stringr::str_c(names(args),args,sep = ' ') %>% 
                     stringr::str_trim() %>% 
                     stringr::str_c('-',.,collapse = ' '))
  res <- tryCatch(system(run.string,
                         ignore.stdout = FALSE,
                         ignore.stderr = FALSE,
                         intern = TRUE),
                  error=function(e) sprintf(''))
  if(exists('old.dir')){
    setwd(old.dir)
  }
}

findMuppet <- function () {
  # Use path-installed muppet if present
  if (nzchar(Sys.which("muppet"))) return(Sys.which("muppet"))

  # Fall back to muppet we compiled on installation
  normalizePath(file.path(
    find.package('rmuppet'),
    'bin',
    .Platform$r_arch,  # NB: R_ARCH in src/install.libs.R has a "/", this doesn't
    if (.Platform$OS.type == 'windows') 'muppet.exe' else 'muppet' ))
}
