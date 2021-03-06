
# metagMisc v.0.0.4 (git b0802ea; Feb 13, 2018)

- New functions
   * `phyloseq_mult_raref_div` - for averaging of diversity metrics across multiple rarefaction iterations
   * `phyloseq_to_MetaCommunity` - converter of phyloseq class to MetaCommunity object from entropart package
   * `phyloseq_otu_occurrence` - estimates taxa occurrence or occurrence frequency
   * `phyloseq_standardize_otu_abundance` - wrapper of decostand function from vegan package
   * `phyloseq_filter_top_taxa` - extracts the most abundant taxa from phyloseq-objects
   * `phyloseq_add_max_tax_rank` - adds the lowest level of taxonomic classification to the taxonomy table
   * `taxonomy_to_qiime` - prepares taxonomy in QIIME-style

- New experimental functions
   * `phyloseq_average`
   * `phyloseq_mult_raref_avg`
   * This functions implements OTU abundance averaging following compositional data analysis workflow.

- Bug fixes
   * `phyloseq_mult_raref` - multithreading fix
   * `phyloseq_to_df` - fix bug with taxonomy order
   * `parse_taxonomy_amptk_batch` - fix column reordering
   * `phyloseq_transform_vst_blind` - add workaround for excessive zeros

- Documentation and some minor updates


# metagMisc v.0.0.3 (git 924976f; Nov 8, 2017)

- New functions
   * `phyloseq_phylo_div` - for phylogenetic diversity estimation
   * `phyloseq_phylo_ses` - standardized effect size for phylogenetic diversity
   * `phyloseq_randomize` - randomization of abundance table and phylogeny in phyloseq objects (for null model testing and simulation)
   * `mult_dissim` - compute beta diversity for each rarefaction iteration
   * `mult_dist_average` - average multiple distance matrices
   * `dissimilarity_to_distance` - transform (non-metric) dissimilarity matrix to a weighted Euclidean distance (metric), as in Greenacre 2017
   * `add_metadata` - wrapper to add sample metadata to data frames
   * `uc_to_sumaclust` - convert UC files (from USEARCH or VSEARCH) to Sumaclust OTU observation maps

- Enhancements
   * `phyloseq_mult_raref` is able to run in parallel now; custom seeds option and rarefaction attributes were added, fixed auto-detection of rarefaction depth
   * `phyloseq_compare` was completely rewritten to allow for one or multiple input phyloseq objects; additional abundance statistics were added; fixed bug with percentage estimation
   * `prevalence` - mean and median OTU abundance were added

- Documentation updates and some other improvements


# metagMisc v.0.0.2 (git fd2697b; Oct 4, 2017)

- New functions
   * `prepare_inext`
   * `phyloseq_filter_sample_wise_abund_trim`
   * `make_utax_taxonomy`
   * `make_utax_taxonomy_batch`
   * `check_tax_uniqueness`

- Enhancements:
   * `phyloseq_group_dissimilarity` - generalized to more than 2 groups
   * `phyloseq_filter_prevalence` - added conditional option (AND/OR) for abundance and prevalence filtering

- Documentation updates


# metagMisc v.0.0.1 (git 591cb8a; Aug 23, 2017)

- New data-handling functions
   * `phyloseq_filter_prevalence`
   * `phyloseq_prevalence_plot`
   * `physeq_rm_na_tax`
   * `phyloseq_sep_variable`

- New functions for dissimilarity analysis
   * `phyloseq_group_dissimilarity`
   * `MultSE`

- Functional diversity related functions
   * `predict_metagenomes`
   * `metagenome_contributions`
   * `filter_cazy`

- New general purpose functions
   * `some`
   * `dist2list`

- Documentation updates and bug fixes


# metagMisc v.0.0.0.9000 (git 5735960; May 4, 2017)

- The first alpha release of metagMisc.
