import scipy.io as sci
import numpy as np
import glob
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats
#from statsmodels.stats.proportion import proportions_ztest
import pylab
import hddm
import kabuki
from functions import *

# Data Formatting 

# load data from directory
datapath = 'ExpData/*.mat'
datafiles = np.array(glob.glob(datapath))

# change from .mat to dataframe
flashdata = np.empty((1,5))
beepdata = np.empty((1,5))
for i in np.arange(0, len(datafiles)):
    mat = sci.loadmat(datafiles[i])
    matf = np.insert(mat['mixtrF'], 0, int(i + 1), axis=1)
    accf = np.hstack((matf, mat['accMatF'], mat['resptimeF']))
    matb = np.insert(mat['mixtrB'], 0, int(i + 1), axis=1)
    accb = np.hstack((matb, mat['accMatB'], mat['resptimeB']))
    flashdata = np.vstack((flashdata, accf))
    beepdata = np.vstack((beepdata, accb))
    
flashdata = flashdata[1:]
beepdata = beepdata[1:]

# rename columns and separate by condition/task
flashframe = pd.DataFrame(flashdata, columns=['subj_idx', 'flashpres', 'beeppres', 'acc', 'rt'])
beepframe = pd.DataFrame(beepdata, columns=['subj_idx', 'flashpres', 'beeppres', 'acc', 'rt'])

congrf = flashframe.loc[flashframe['flashpres'] == flashframe['beeppres']]
unif = flashframe.loc[flashframe['beeppres'] == 0]
congrb = beepframe.loc[beepframe['flashpres'] == beepframe['beeppres']]
unib = beepframe.loc[beepframe['flashpres'] == 0]

# remove subj 15 because of outlier/superhuman data
subject1 = 15

flashframe = droprow(flashframe, 0.05)
flashframe = dropsubj(flashframe, subject1)
flashframe = droprow(flashframe, 10, False)
beepframe = droprow(beepframe, 0.05)
beepframe = dropsubj(beepframe, subject1)
beepframe = droprow(beepframe, 10, False)


# bisensory flash data
congrf = flashframe.loc[flashframe['flashpres'] == flashframe['beeppres']]
# unisensory flash data
unif = flashframe.loc[flashframe['beeppres'] == 0]
# bisensory auditory data
congrb = beepframe.loc[beepframe['flashpres'] == beepframe['beeppres']]
# unisensory auditory data
unib = beepframe.loc[beepframe['flashpres'] == 0]


# calculate dprime and beta for unif

unifhits = np.zeros(14)
uniffalsealarms = np.zeros(14)
unifdprime = np.zeros(14)
unifbeta = np.zeros(14)
for i in np.arange(14):
    unifhits[i] = float(len(unif.loc[(unif['flashpres'] == 2) & (unif['acc'] == 1) & (unif['subj_idx'] == (i + 1))])) / len(unif.loc[(unif['flashpres'] == 2) & (unif['subj_idx'] == (i + 1))])
    uniffalsealarms[i] = float(len(unif.loc[(unif['flashpres'] == 3) & (unif['acc'] == 0) & (unif['subj_idx'] == (i + 1))])) / len(unif.loc[(unif['flashpres'] == 3) & (unif['subj_idx'] == (i + 1))])
    
    unifhits = np.where(unifhits == 1, (1 - 0.01), unifhits)
    uniffalsealarms = np.where(uniffalsealarms == 0, 0.01, uniffalsealarms)
    
    unifdprime[i] = stats.norm.ppf(unifhits[i]) - stats.norm.ppf(uniffalsealarms[i])
    unifbeta[i] = 0.5*(stats.norm.ppf(unifhits[i]) + stats.norm.ppf(uniffalsealarms[i]))

# calculate dprime and beta for congrf

congrfhits = np.zeros(14)
congrffalsealarms = np.zeros(14)
congrfdprime = np.zeros(14)
congrfbeta = np.zeros(14)
for i in np.arange(14):
    congrfhits[i] = float(len(congrf.loc[(congrf['flashpres'] == 2) & (congrf['acc'] == 1) & (congrf['subj_idx'] == (i + 1))])) / len(congrf.loc[(congrf['flashpres'] == 2) & (congrf['subj_idx'] == (i + 1))])
    congrffalsealarms[i] = float(len(congrf.loc[(congrf['flashpres'] == 3) & (congrf['acc'] == 0) & (congrf['subj_idx'] == (i + 1))])) / len(congrf.loc[(congrf['flashpres'] == 3) & (congrf['subj_idx'] == (i + 1))])
    
    congrfhits = np.where(congrfhits == 1, (1 - 0.01), congrfhits)
    congrffalsealarms = np.where(congrffalsealarms == 0, 0.01, congrffalsealarms)
    
    congrfdprime[i] = stats.norm.ppf(congrfhits[i]) - stats.norm.ppf(congrffalsealarms[i])
    congrfbeta[i] = 0.5*(stats.norm.ppf(congrfhits[i]) + stats.norm.ppf(congrffalsealarms[i]))

# calculate dprime and beta for unib

unibhits = np.zeros(14)
unibfalsealarms = np.zeros(14)
unibdprime = np.zeros(14)
unibbeta = np.zeros(14)
for i in np.arange(14):
    unibhits[i] = float(len(unib.loc[(unib['beeppres'] == 2) & (unib['acc'] == 1) & (unib['subj_idx'] == (i + 1))])) / len(unib.loc[(unib['beeppres'] == 2) & (unib['subj_idx'] == (i + 1))])
    unibfalsealarms[i] = float(len(unib.loc[(unib['beeppres'] == 3) & (unib['acc'] == 0) & (unib['subj_idx'] == (i + 1))])) / len(unib.loc[(unib['beeppres'] == 3) & (unib['subj_idx'] == (i + 1))])
    
    unibhits = np.where(unibhits == 1, (1 - 0.01), unibhits)
    unibfalsealarms = np.where(unibfalsealarms == 0, 0.01, unibfalsealarms)
    
    unibdprime[i] = stats.norm.ppf(unibhits[i]) - stats.norm.ppf(unibfalsealarms[i])
    unibbeta[i] = 0.5*(stats.norm.ppf(unibhits[i]) + stats.norm.ppf(unibfalsealarms[i]))

# calculate dprime and beta for congrb

congrbhits = np.zeros(14)
congrbfalsealarms = np.zeros(14)
congrbdprime = np.zeros(14)
congrbbeta = np.zeros(14)
for i in np.arange(14):
    congrbhits[i] = float(len(congrb.loc[(congrb['beeppres'] == 2) & (congrb['acc'] == 1) & (congrb['subj_idx'] == (i + 1))])) / len(congrb.loc[(congrb['beeppres'] == 2) & (congrb['subj_idx'] == (i + 1))])
    congrbfalsealarms[i] = float(len(congrb.loc[(congrb['beeppres'] == 3) & (congrb['acc'] == 0) & (congrb['subj_idx'] == (i + 1))])) / len(congrb.loc[(congrb['beeppres'] == 3) & (congrb['subj_idx'] == (i + 1))])
    
    congrbhits = np.where(congrbhits == 1, (1 - 0.01), congrbhits)
    congrbfalsealarms = np.where(congrbfalsealarms == 0, 0.01, congrbfalsealarms)
    
    congrbdprime[i] = stats.norm.ppf(congrbhits[i]) - stats.norm.ppf(congrbfalsealarms[i])
    congrbbeta[i] = 0.5*(stats.norm.ppf(congrbhits[i]) + stats.norm.ppf(congrbfalsealarms[i]))

np.std(congrbbeta)

np.mean(congrfbeta)

stats.ttest_rel(unifdprime, congrfdprime)

stats.ttest_rel(unifbeta, congrfbeta)

stats.ttest_rel(unibdprime, congrbdprime)

stats.ttest_rel(unibbeta, congrbbeta)