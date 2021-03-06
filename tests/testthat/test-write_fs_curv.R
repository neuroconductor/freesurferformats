test_that("A curv file can be written", {
  output_file = tempfile();

  # generate data
  data_length = 149244;
  data = rep(1.25, data_length);
  data[5] = 3.5;

  # write data to file
  write.fs.curv(output_file, data);

  # load data again and check it
  read_data = read.fs.curv(output_file);
  expect_equal(data, read_data);
})


test_that("Writing morph files in a format based on the filename works", {

  # generate data
  data_length = 149244;
  data = rep(1.25, data_length);
  data[5] = 3.5;

  # write data to files
  format_written = write.fs.morph(tempfile(fileext="mgh"), data);
  expect_equal(format_written, "mgh");

  format_written = write.fs.morph(tempfile(fileext="whatever"), data);
  expect_equal(format_written, "curv");

  format_written = write.fs.morph(tempfile(fileext="whatever.gz"), data);
  expect_equal(format_written, "curv");

  format_written = write.fs.morph(tempfile(fileext="mgz"), data);
  expect_equal(format_written, "mgz");
})


test_that("Morphometry file formats are derived from file names correctly", {
  data_length = 149244;
  data = rep(1.25, data_length);
  data[5] = 3.5;

  expect_equal(write.fs.morph(tempfile(fileext="mgh"), data), "mgh");
  expect_equal(write.fs.morph(tempfile(fileext="mgz"), data), "mgz");
  expect_equal(write.fs.morph(tempfile(fileext=""), data), "curv");
  expect_equal(write.fs.morph(tempfile(fileext="gz"), data), "curv");
})


test_that("Morphometry file formats are derived from file names correctly", {
  data_length = 149244;
  data = rep(1.25, data_length);
  data[5] = 3.5;

  expect_equal(fs.get.morph.file.format.from.filename("/blah.mgh"), "mgh");
  expect_equal(fs.get.morph.file.format.from.filename("/blah.mgz"), "mgz");
  expect_equal(fs.get.morph.file.format.from.filename("/blah.whatever"), "curv");
  expect_equal(fs.get.morph.file.format.from.filename("/blah.whatever.gz"), "curv");
})



test_that("Morphometry file extensions are derived from formats correctly when writing morph data files", {
  expect_equal(fs.get.morph.file.ext.for.format("mgh"), ".mgh");
  expect_equal(fs.get.morph.file.ext.for.format("mgz"), ".mgz");
  expect_equal(fs.get.morph.file.ext.for.format("curv"), "");
  expect_error(fs.get.morph.file.ext.for.format("nosuchformat"));
})


test_that("Writing morph files and re-reading the data works for different formats", {

  # generate data
  data_length = 149;
  data = rep(1.25, data_length);
  data[5] = 3.5;

  # FreeSurfer ASCII curv format
  asc_file = tempfile(fileext = ".asc");
  write.fs.morph.asc(asc_file, data);
  asc_data = read.fs.morph.asc(asc_file);
  asc_data2 = read.fs.curv(asc_file);
  expect_equal(length(asc_data), 149L);
  expect_equal(length(asc_data2), 149L);
  expect_equal(asc_data[5], 3.5);
  expect_equal(asc_data2[5], 3.5);

  # simple text format: one value per line
  txt_file = tempfile(fileext = ".txt");
  write.fs.morph.txt(txt_file, data);
  txt_data = read.fs.morph.txt(txt_file);
  txt_data2 = read.fs.curv(txt_file);
  expect_equal(length(txt_data), 149L);
  expect_equal(length(txt_data2), 149L);
  expect_equal(txt_data[5], 3.5);
  expect_equal(txt_data2[5], 3.5);
})


test_that("Trying to write invalid data with write.fs.curv or write.fs.morph leads to erroes", {
  filepath = tempfile(fileext = ".asc");
  data = rep(0.9, 100L);
  expect_error(write.fs.morph.asc(filepath, data, coords = matrix(seq(300), ncol = 4))); # wrong number of columns in coords
  expect_error(write.fs.morph(filepath, data, format = 'invalid')); # invalid format
  expect_error(write.fs.morph(filepath, data, format = 'invalid')); # invalid format
})


test_that("Morph data can be written in GIFTI format", {
  filepath = tempfile(fileext = ".gii");
  data = rep(0.9, 100L);
  write.fs.morph(filepath, data, format = 'gii');
  write.fs.morph(filepath, data);
  write.fs.morph.gii(filepath, data);
  expect_equal(data, read.fs.morph.gii(filepath), tolerance = 1e-2);
})


test_that("Warning sare shown when writing integer data.", {
  filepath = tempfile();
  integer_data = rep(2L, 100L);
  expect_warning(write.fs.morph.asc(filepath, integer_data)); # should be double, will be coerced to double
  expect_warning(write.fs.morph.txt(filepath, integer_data)); # should be double, will be coerced to double
  expect_warning(write.fs.curv(filepath, integer_data)); # should be double, will be coerced to double
})


test_that("Morph data without FreeSurfer hack can be written in NIFTI v1 format using write.fs.morph.", {
  filepath = tempfile(fileext = ".nii");
  ndata = rep(0.9, 100L);
  write.fs.morph(filepath, ndata, format = 'ni1');
  write.fs.morph(filepath, ndata);
  write.fs.morph.ni1(filepath, ndata);
  testthat::expect_equal(ndata, read.fs.morph(filepath), tolerance = 1e-2);
  testthat::expect_equal(ndata, read.fs.morph(filepath, format = 'nii'), tolerance = 1e-2);
})


test_that("Morph data can be written in NIFTI v2 format using write.fs.morph.", {
  filepath = tempfile(fileext = ".nii");
  ndata = rep(0.9, 100L);
  write.fs.morph(filepath, ndata, format = 'ni2');
  write.fs.morph.ni2(filepath, ndata);
  testthat::expect_equal(ndata, read.fs.morph(filepath, format = 'ni2'), tolerance = 1e-2);
  testthat::expect_equal(ndata, read.fs.morph(filepath, format = 'nii'), tolerance = 1e-2);
})


