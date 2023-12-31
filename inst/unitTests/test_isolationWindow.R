test_isolationWindow <- function() {
    library("msdata")
    f <- msdata::proteomics(full.names = TRUE,
                            pattern = "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01.mzML.gz")
    rw2 <- openMSfile(f, backend = "pwiz")
    i1 <- isolationWindow(f)
    i3 <- isolationWindow(rw2)
    checkEquals(i1, i3)
    i1 <- isolationWindow(f, unique = FALSE)
    i3 <- isolationWindow(rw2, unique = FALSE)
    checkEquals(i1, i3)
    i1 <- isolationWindow(c(f, f), unique = FALSE)
    checkEquals(length(i1), 2L)
    checkEquals(i1[[1]], i1[[2]])
    hd <- header(rw2)
    checkEquals(sum(hd$msLevel == 2), nrow(i1[[1]]))
}
