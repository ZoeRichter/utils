import glob
import shutil
from os import path


def write_serpent_misc_data(datapath, serpent_file):
    '''
    Given a path to a directory containing ENDF format data files (*.endf) for
    decay, spontaneous fission yields, and neutron-induced fission yields, this
    will append the data into a single file that can be used as the respective
    library file in Serpent.

    Parameters
    ----------
    datapath : str
        Path to the directory containing the .endf files to be aggregated.
        Note that this function uses the os package to expand the `~`
        shorthand, so paths should be given as `~/path/to/data`, not 
        `/home/user/path/to/data`
    serpent_file : str
        Name of the file this function generates.  File extensions commonly
        match the library being generated, e.g.: `sss_endfX.dec`, 
        `sss_endfX.nfy`, or `sss_endfX.sfy`.

    Returns
    ----------
    This function has no returns, but does generate a file named serpent_file
    '''
    dpath = path.expanduser(datapath)
    data_files = glob.glob(path.join(dpath, "*.endf"))

    with open(serpent_file, mode='wb') as sssf:
        for data_file in data_files:
            with open(data_file, mode = 'rb') as dataf:
                shutil.copyfileobj(dataf, sssf)






