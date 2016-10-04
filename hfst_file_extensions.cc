namespace hfst {

  class HfstFile {
    private:
      FILE * file;
    public:
      HfstFile();
      ~HfstFile();
      void set_file(FILE * f);
      FILE * get_file();
      void close();
      void write(const char * str);
      bool is_eof(void);
  };

  HfstFile::HfstFile(): file(NULL){};
  HfstFile::~HfstFile() {};
  void HfstFile::set_file(FILE * f) { file = f; };
  FILE * HfstFile::get_file() { return file; };
  void HfstFile::close() { if (file != stdout && file != stderr && file != stdin) { fclose(file); } };
  void HfstFile::write(const char * str) { fprintf(file, "%s", str); };
  bool HfstFile::is_eof(void) { return (feof(file) != 0); };

  HfstFile hfst_open(const char * filename, const char * mode) {
    FILE * f = fopen(filename, mode);
    if (f == NULL) { throw StreamNotReadableException("", "", 0); }
    HfstFile file;
    file.set_file(f);
    return file;
  };

  HfstFile hfst_stdin() {
    HfstFile file;
    file.set_file(stdin);
    return file;
  };

  HfstFile hfst_stdout() {
    HfstFile file;
    file.set_file(stdout);
    return file;
  };

}
