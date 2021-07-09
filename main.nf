#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/testpipe
========================================================================================
    Github : https://github.com/nf-core/testpipe
    Website: https://nf-co.re/testpipe
    Slack  : https://nfcore.slack.com/channels/testpipe
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { TESTPIPE } from './workflows/testpipe'

//
// WORKFLOW: Run main nf-core/testpipe analysis pipeline
//
workflow NFCORE_TESTPIPE {
    TESTPIPE ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_TESTPIPE ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
