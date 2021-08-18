#!/usr/bin/env python
# coding: utf-8

# In[6]:


import scipy.io as sci
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats
from matplotlib.offsetbox import AnchoredText


# In[1]:


def calcstderr(data, col):
    num = float(0)
    count = 0
    for i, subj_data in data.groupby('subj_idx'):
        num += subj_data[col].var()
        count += 1
    s_w = np.sqrt(num/(count)) / (count - 1)
    return(s_w)


# if subject id is not given, plot the means including std
def plotbars(flashuni, beepuni, flashcongr, beepcongr, title, width, subjid = -1):
    if (subjid != -1):
        flashuni = flashuni.loc[flashuni['subj_idx'] == subjid]
        beepuni = beepuni.loc[beepuni['subj_idx'] == subjid]
        flashcongr = flashcongr.loc[flashcongr['subj_idx'] == subjid]
        beepcongr = beepcongr.loc[beepcongr['subj_idx'] == subjid]
        
    ## % correct plot
    flashuniacc = flashuni['acc'].mean()
    beepuniacc = beepuni['acc'].mean()
    flashcongracc = flashcongr['acc'].mean()
    beepcongracc = beepcongr['acc'].mean()
    #allcongracc = (flashcongracc + beepcongracc) / 2
    
    if(subjid == -1):
        fig = plt.figure(figsize=(8,5)) 
        ax = fig.add_subplot(111)
        ax.set_xlabel('condition', fontsize = 22)
        ax.set_ylabel('% correct', fontsize = 22)
        plt.tick_params(axis = 'x', labelsize = 17)
        plt.tick_params(axis = 'y', labelsize = 17)
        plt.tick_params(axis = 'x', labelsize = 17)
        plt.tick_params(axis = 'y', labelsize = 17)
    '''
    else:
        fig = plt.figure(figsize=(12,5)) 
        ax = fig.add_subplot(121)
    ax.set_xlabel('condition', fontsize = 22)
    ax.set_ylabel('% correct', fontsize = 22)
    plt.tick_params(axis = 'x', labelsize = 17)
    plt.tick_params(axis = 'y', labelsize = 17)
    plt.tick_params(axis = 'x', labelsize = 17)
    plt.tick_params(axis = 'y', labelsize = 17)
    '''

    objects = ('Unisensory \nVisual',  'Bisensory \nVisual', 'Unisensory \nAuditory', 'Bisensory \nAuditory')
    #y_pos = np.arange(len(objects))
    performance = [flashuniacc, flashcongracc, beepuniacc, beepcongracc]
    
    def label_diff(i,j,text,X,Y,k = 1):
        props = {'connectionstyle':'bar','arrowstyle':'-',\
                     'shrinkA':20,'shrinkB':20,'linewidth':1}
        if k == 0:
            x = (X[i]+X[j])/2
            y = 1.05*max(Y[i], Y[j])
            dx = abs(X[i]-X[j])
            ax.annotate(text, xy=(x + 0.5,y+0.25), zorder=10, ha= 'center', size = 15)
            ax.annotate('', xy=(X[i],y), xytext=(X[j],y), arrowprops=props)
        else:
            x = (X[i]+X[j])/2
            y = 1.05*max(Y[i], Y[j])
            dx = abs(X[i]-X[j])
            ax.annotate(text, xy=(x + 0.5,y+0.25), zorder=10, ha= 'center', size = 15)
            ax.annotate('', xy=(X[i], y - 0.15), xytext=(X[j], y - 0.15), arrowprops=props)
        
    
    
    y_pos = [0,1,3,4]
    if(subjid == -1):
        
        colors = ['#1f77b4', '#ff7f0e', '#d62728', '#9467bd']
        
        vplot = plt.violinplot([flashuni.groupby(by = ['subj_idx']).mean()['acc'], 
                                flashcongr.groupby(by = ['subj_idx']).mean()['acc'], 
                                beepuni.groupby(by = ['subj_idx']).mean()['acc'], 
                                beepcongr.groupby(by = ['subj_idx']).mean()['acc']], positions = [0,1,3,4])
        for patch, color in zip(vplot['bodies'], colors):         
            patch.set_color(color)
            patch.set_edgecolor(color)
        label_diff(0, 1, "***", range(5), performance, 0)
        label_diff(3, 4, "n.s.", range(5), np.insert(performance, 0, 2), 0)

        at = AnchoredText("***  p < 0.001\n        N = 14",
                      prop=dict(size=14), frameon=True,
                      loc='lower right',
                      )
        at.patch.set_boxstyle("round,pad=0.,rounding_size=0.2")
        ax.add_artist(at)
        plt.ylim([0, 1.5])
        plt.xticks(y_pos, objects)
        plt.tight_layout()
        
    #else:
    #    plt.bar(y_pos, performance, color=['#1f77b4', '#ff7f0e', '#d62728', '#9467bd'], ecolor='black', capsize=10, width = width)
    #    plt.ylim([0,1])
    
    if (subjid == -1):
        plt.savefig('accuracy.png', bbox_inches = 'tight')
    
    ## mean rt plot, only want accurate trials
    flashunirt = flashuni.loc[flashuni['acc'] == 1]['rt'].mean()
    beepunirt = beepuni.loc[beepuni['acc'] == 1]['rt'].mean()
    flashcongrrt = flashcongr.loc[flashcongr['acc'] == 1]['rt'].mean()
    beepcongrrt = beepcongr.loc[beepcongr['acc'] == 1]['rt'].mean()
    #allcongrrt = (flashcongrrt + beepcongrrt) / 2
    

    if (subjid == -1):
        fig = plt.figure(figsize=(8,5)) 
        ax = fig.add_subplot(111)
        ax.set_xlabel('condition', fontsize = 22)
        ax.set_ylabel('response time (s)', fontsize = 22)
        objects = ('Unisensory \nVisual',  'Bisensory \nVisual', 'Unisensory \nAuditory', 'Bisensory \nAuditory')
        y_pos = [0,1,3,4] 
        performance = [flashunirt, flashcongrrt, beepunirt, beepcongrrt]
    #else:
    #    ax = fig.add_subplot(122)
    
    if (subjid == -1):
        
        vplot = plt.violinplot([flashuni.groupby(by = ['subj_idx']).mean()['rt'], 
                                flashcongr.groupby(by = ['subj_idx']).mean()['rt'], 
                                beepuni.groupby(by = ['subj_idx']).mean()['rt'], 
                                beepcongr.groupby(by = ['subj_idx']).mean()['rt']], positions = [0,1,3,4])
        for patch, color in zip(vplot['bodies'], colors):         
            patch.set_color(color)
            patch.set_edgecolor(color)
            
        label_diff(0, 1, "n.s.", range(5), [max(flashuni.groupby(by = ['subj_idx']).mean()['rt']), 
                                            max(flashcongr.groupby(by = ['subj_idx']).mean()['rt']), 
                                            max(beepuni.groupby(by = ['subj_idx']).mean()['rt']), 
                                            max(beepcongr.groupby(by = ['subj_idx']).mean()['rt'])], 1)
        label_diff(3, 4, "n.s.", range(5), [max(flashuni.groupby(by = ['subj_idx']).mean()['rt']), 
                                            max(flashcongr.groupby(by = ['subj_idx']).mean()['rt']), 
                                            0,
                                            max(beepuni.groupby(by = ['subj_idx']).mean()['rt']), 
                                            max(beepcongr.groupby(by = ['subj_idx']).mean()['rt'])], 1)
        
        at = AnchoredText("N = 14",
                      prop=dict(size=14), frameon=True,
                      loc='lower right',
                      )
        at.patch.set_boxstyle("round,pad=0.,rounding_size=0.2")
        ax.add_artist(at)
        
        plt.tight_layout()
        plt.gcf().subplots_adjust(bottom=0.25)
        plt.xticks(y_pos, objects)
        plt.ylim([0,2])
        plt.tick_params(axis = 'x', labelsize = 17)
        plt.tick_params(axis = 'y', labelsize = 17)
        plt.tick_params(axis = 'x', labelsize = 17)
        plt.tick_params(axis = 'y', labelsize = 17)
    #else:
    #    plt.bar(y_pos, performance, color=['#1f77b4', '#ff7f0e', '#d62728', '#9467bd'], ecolor='black', capsize=10, width = width)
    #    plt.suptitle(title, fontsize = 15)
    #    fig.tight_layout(rect=[0, 0.03, 1, 0.95])

    
    
    if (subjid == -1):
        plt.savefig('mean_rt.png', bbox_inches = 'tight')
    #else:
    #    plt.savefig('subj' + str(int(i + 1)) + '.png')
    #    print('subj ', subjid,  beepuniacc, beepcongracc)



def droprow(df, val, less=True):
    if(less):
        return(df.drop(df.index[df['rt'] < val].tolist(), axis=0))
    else:
        return(df.drop(df.index[df['rt'] > val].tolist(), axis=0))
    
def dropsubj(df, val):
    return(df.drop(df.index[df['subj_idx'] == val].tolist(), axis=0))


# In[4]:


def formatmodeldata(df, conditions, choices):
    dframe = df.copy()
    dframe.columns = ['subj_idx', 'flashpres', 'beeppres', 'response', 'rt']
    dframe['stimName'] = np.select(conditions, choices)
    return(dframe)

