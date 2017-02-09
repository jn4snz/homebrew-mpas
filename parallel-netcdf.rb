require "formula"

class ParallelNetcdf < Formula
  homepage "https://trac.mcs.anl.gov/projects/parallel-netcdf"
  url "http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.4.1.tar.bz2"
  sha256 "a79e8bfebde5baaa17470ff4425cbdcf99bd3cd265efdf3a8aedeca91c057463"

  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "jn4snz/mpas/netcdf" => "enable-fortran"
  depends_on 'gcc@4.8'

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    #puts ENV['FC']
    #ENV['FC'] = "ifort"
    ENV['FC'] = "/usr/local/bin/gfortran-4.8"
    ENV['CC'] = "/usr/local/bin/gcc-4.8"
    ENV['MPIF77'] = "/usr/local/bin/mpif77"
    ENV['MPIF90'] = "/usr/local/bin/mpif90"
    ENV['MPICC'] = "/usr/local/bin/mpicc"
    puts ENV['CC']
    puts ENV['FC']
    puts ENV['MPICC']
    puts ENV['MPIF77']
    puts ENV['MPIF90']
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"

    # test libraries
    Dir.chdir('test') do
      system "make check testing"
    end

  end
end
